#!/bin/bash

while getopts "i:o:s:vrlu" opt; do
  case "$opt" in
    i) input_file=$OPTARG ;;
    o) output_file=$OPTARG ;;
    s) sub_arg=$OPTARG ;;
    v) toggle_case=true ;;
    r) reverse=true ;;
    l) lower=true ;;
    u) upper=true ;;
    *) echo "Usage: $0 -i <input> -o <output> [-v] [-s 'A B'] [-r] [-l] [-u']"; exit 1 ;;
  esac
done

[[ -z $input_file || -z $output_file ]] && {
  echo "Missing input/output file"; exit 1;
}

[[ ! -f $input_file ]] && {
  echo "Input file not found: $input_file"; exit 1;
}

# Start from input file
input_str="cat \"$input_file\""

# Apply substitution
if [[ $sub_arg ]]; then
  a=$(echo "$sub_arg" | awk '{print $1}')
  b=$(echo "$sub_arg" | awk '{print $2}')
  input_str+=" | sed 's/$a/$b/g'"
fi

# Apply case transformations
[[ $toggle_case ]] && input_str+=" | tr 'A-Za-z' 'a-zA-Z'"
[[ $lower ]] && input_str+=" | tr 'A-Z' 'a-z'"
[[ $upper ]] && input_str+=" | tr 'a-z' 'A-Z'"

# Reverse line order
[[ $reverse ]] && input_str+=" | tac"
eval "$input_str" > "$output_file"