#!/bin/sh

_host="$1"

while ! ping -q -c1 -W1 "$_host" >/dev/null 2>&1; do
    :
done
