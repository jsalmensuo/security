#!/bin/bash

: <<'COMMENT' 
In case your bash is not located in /bin/bash and you get an error: 
bad interpreter: No such file or directory remove the line #!/bin/bash
and replace it with #!/usr/bin/env bash. 
Usually you encounter this on MacOS, NixOS or any flavor of BSD. 
COMMENT

#============================================================================ 
# This script is designed as a conceptual aid to demonstrate byte ordering 
# (Endianness) in a human-readable way.  
# Note: This is NOT an enterprise-grade utility. It is optimized for  
# transparency and readability rather than performance or complex error  
# handling. It is intended for CTF practice and binary analysis concepts. 
#============================================================================ 

echo "The endian conversion is a minimal script for byte order demonstration"
echo "Before bytes can be arranged, they must first be interpreted as numbers"
echo " "

# Read user input
read -p "Enter a word to be converted into hexadecimal: " WORD  

# Convert to Hexadecimal
HEX=$(echo -n "$WORD" | xxd -p)

# Reverse the bytes for Little-Endian
LE=$(echo -n "$HEX" | sed 's/\(..\)/\1 /g' | tac -rs ' ' | tr -d ' ')

# Output results, using printf for more control over formatting
printf "Big-Endian: %s\n" "$HEX"
printf "Little-Endian: %s\n" "$LE"

