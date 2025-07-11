# Text File Transformer Script

This Bash script takes an input file and applies a series of optional text transformations based on user-supplied flags. The transformed content is saved to a specified output file.

## Usage

```bash
./script.sh -i <input_file> -o <output_file> [options]
```

### Required Arguments

- `-i <input_file>`: Path to the input file.
- `-o <output_file>`: Path to the output file.

### Optional Flags

- `-s "A B"`: Substitute all occurrences of the string `A` with the string `B`.
- `-v`: Toggle the case of all characters in the file (uppercase becomes lowercase, and vice versa).
- `-r`: Reverse the order of lines in the file.
- `-l`: Convert all letters to lowercase.
- `-u`: Convert all letters to uppercase.

> ⚠️ If multiple case transformation flags (`-v`, `-l`, `-u`) are used together, they are applied in the order: `-v`, `-l`, `-u`.

## Examples

### Substitute text and convert to uppercase:
```bash
./script.sh -i input.txt -o output.txt -s "foo bar" -u
```

### Toggle case and reverse line order:
```bash
./script.sh -i input.txt -o output.txt -v -r
```

### Lowercase conversion only:
```bash
./script.sh -i input.txt -o output.txt -l
```
