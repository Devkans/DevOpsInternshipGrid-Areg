#!/bin/bash

opts="vs:r:lui:o:"

INPUT_FILE=""
OUTPUT_FILE=""
TMP_FILE=$(mktemp)

# Default working file
WORK_FILE="$TMP_FILE"

# Functions
replace_word () {
    A_WORD=$(echo "$OPTARG" | awk '{print $1}')
    B_WORD=$(echo "$OPTARG" | awk '{print $2}')
    sed "s/$A_WORD/$B_WORD/g" "$WORK_FILE" > "$TMP_FILE"
    cp "$TMP_FILE" "$WORK_FILE"
}

to_lowercase () {
    awk '{print tolower()}' "$WORK_FILE" > "$TMP_FILE"
    cp "$TMP_FILE" "$WORK_FILE"
}

to_uppercase () {
    awk '{print toupper()}' "$WORK_FILE" > "$TMP_FILE"
    cp "$TMP_FILE" "$WORK_FILE"
}

reverse_string () {
    tac "$WORK_FILE" > "$TMP_FILE"
    cp "$TMP_FILE" "$WORK_FILE"
}

lowUp_upLow () {
    sed 'y/abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz/' "$WORK_FILE" > "$TMP_FILE"
    cp "$TMP_FILE" "$WORK_FILE"
}

# Argument parsing
while getopts $opts arg; do
    case "$arg" in
        i)
            INPUT_FILE="$OPTARG"
            cp "$INPUT_FILE" "$WORK_FILE"
            ;;
        o)
            OUTPUT_FILE="$OPTARG"
            ;;
        v)
            lowUp_upLow
            ;;
        s)
            replace_word
            ;;
        r)
            reverse_string
            ;;
        l)
            to_lowercase
            ;;
        u)
            to_uppercase
            ;;
    esac
done

# Write final result to output
cp "$WORK_FILE" "$OUTPUT_FILE"
rm "$TMP_FILE"