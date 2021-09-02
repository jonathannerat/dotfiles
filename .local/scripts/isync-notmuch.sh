#!/bin/sh

# usage: isync-notmuch.sh [ACCOUNT]
# Where ACCOUNT is a folder inside maildir. If no ACCOUNT is provided,
# all folders inside maildir are checked

escapetag() {
	local tag="$1"

	# lowercase, no spaces
	tag=$(echo "$tag" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
	# remove [gmail] folder
	tag=${tag#\[gmail\]}
	# also remove the trailing separator
	tag=${tag#/}
	# remove inbox/ folder
	tag=${tag#inbox/}
	# remove -mail suffix from all tags
	tag=${tag%-mail}

	# use common tags
	case "$tag" in
		junk) echo "spam" ;;
		*) echo "$tag";;
	esac
}

organize_account() {
	local account="$1"
	local accountdir="$maildir/$account"
	echo "Organizing account: $account"
	# assign account to each new mail (unorganized mails)
	notmuch tag +account/"$account" -- tag:new and path:"$account"/'**'
	find "$accountdir" -mindepth 1 -type d \
		-not \( -name cur -o -name new -o -name tmp \) -printf "%P\n" \
		| while read -r tagdir; do

			local esctagdir=$(escapetag "$tagdir")
			[ -z "$esctagdir" ] && continue
			echo "Tagging: $tagdir -> $esctagdir"
			# tag unorganized mails respecting upstream labels
			notmuch tag +"$esctagdir" -- tag:new and path:"$account/$tagdir"/\*\*
	done
}

maildir=$(notmuch config get database.path)
account="$1"
accounts=$(find "$maildir" -mindepth 1 -maxdepth 1 -type d -not -name .notmuch -printf "%P ")
# remove trailing space
accounts="${accounts% }"

# fetch new mail
notmuch new

# exit if no new mail
[ "$(notmuch count tag:new)" = 0 ] && exit 0

if [ -n "$account" ]; then
	organize_account "$account"
else
	for a in $accounts; do
		organize_account "$a"
	done
fi

# tag mails from my emails as +sent
for a in $accounts; do
	my_email=$(notmuch config get accounts."$a")
	from_me_query="$from_me_query or from:$my_email"
done
# remove first "or"
from_me_query=${from_me_query# or }

if [ -n "$account" ]; then
	filter="and tag:account/$account"
else
	filter=""
fi

notmuch search --output=summary --format=json tag:new $filter \
| jq -r 'map({ account: .tags[0][8:], from: .authors, subject: .subject, id: .query[0][3:] }) | .[] | [.account,.from,.subject,.id] | @tsv' \
| while IFS='	' read -r account from subject id; do
	notify-send.sh -i mail-unread -a neomutt -d "notmuch tag -new -- id:$id" "[$account] $from" "$subject"
done

if [ -n "$account" ]; then
	# shellcheck disable=SC2086
	notmuch tag +sent -- tag:new and $from
	notmuch tag -new -- tag:account/"$account" tag:new
else
	# shellcheck disable=SC2086
	notmuch tag +sent -- tag:new and $from
	notmuch tag -new -- tag:new
fi
