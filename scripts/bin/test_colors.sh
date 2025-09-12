#!/usr/bin/env bash

# reference: https://unix.stackexchange.com/questions/269077/tput-setaf-color-table-how-to-determine-color-codes


echo -e "Term colors available: $(tput colors)"

function test_basic() {
  printf '\e[%sm▒' {30..37} 0; echo           ### foreground
  printf '\e[%sm ' {40..47} 0; echo           ### background
}

color(){
    for c; do
        printf '\e[48;5;%dm%03d' $c $c
    done
    printf '\e[0m \n'
}

echo -e "Basic xterm colors"
test_basic 

echo -e "256 colors"
IFS=$' \t\n'
color {0..15}
for ((i=0;i<6;i++)); do
    color $(seq $((i*36+16)) $((i*36+51)))
done
color {232..255}

