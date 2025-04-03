#!/usr/bin/env bash

# save newline separated string into an array
mapfile -t website <<< "$(buku -p -f 4 | awk -F"\t" '{ print $1"\t"$3"\t"$4"\t"$2 }' | column -ts$'\t' | fzf --multi)"

# open each website
for i in "${website[@]}"; do
  index="$(echo "$i" | awk '{print $1}')"
  buku -p "$index"
  buku -o "$index"
done

