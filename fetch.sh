#!/bin/sh

# fetch livebook files from my server

rsync "jack@jackharrhy.dev:~/jackharrhy.com-ops/core/volumes/livebook/advent2021/*" .

for file in *.livemd; do
  [ -e "$file" ] || [ -L "$file" ] || continue

  { echo "<!-- vim: syntax=markdown -->\n" & cat "$file"; } > "new_$file"

  mv "new_$file" "$file"
done
