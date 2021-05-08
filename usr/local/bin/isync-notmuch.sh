#!/bin/sh

escapetag() {
	tag="$1"

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
		outbox) echo "sent" ;;
		junk) echo "spam" ;;
		*) echo "$tag";;
	esac
}

organize_account() {
	account="$1"
	accountdir="$maildir/$account"
	echo "Organizing account: $account"
	# assign account to each new mail (unorganized mails)
	notmuch tag +account/"$account" -- tag:new and path:"$account"/'**'
	find "$accountdir" -mindepth 1 -type d \
		-not \( -name cur -o -name new -o -name tmp \) -printf "%P\n" \
		| while read -r tagdir; do

			esctagdir=$(escapetag "$tagdir")
			[ -z "$esctagdir" ] && continue
			echo "Tagging: $account/$tagdir -> $esctagdir"
			# tag unorganized mails respecting upstream labels
			notmuch tag +"$esctagdir" -- tag:new and path:'"$account/$tagdir/**"'
	done
}

maildir=$(notmuch config get database.path)
account="$1"

# fetch new mail
notmuch new

if [ "$(notmuch count tag:new)" = 0 ]; then
	# nothing new, don't do anything
	exit 0
fi

if [ -n "$account" ]; then
	organize_account "$account"
else
	## assign an accounts/tags to all new mails
	for accountdir in "$maildir"/*; do
		account=${accountdir##*/}
		organize_account "$account"
	done
fi

# tag mails from my emails as +sent
my_emails="$(notmuch config get user.primary_email; notmuch config get user.other_email)"
from_me_query=""
echo -n $my_emails | while read -r my_email; do
	from_me_query="$from_me_query or from:$my_email"
done
# remove first "or"
from_me_query=${from_me_query# or }

notmuch tag +sent -- tag:new and \( $from_me_query \)
notmuch tag -new -- tag:new
