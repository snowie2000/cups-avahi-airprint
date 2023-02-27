#!/bin/sh

# Loop through each file in /opt/filter
for file in /filter/*; do
    # Extract the filename without the path
    filename=$(basename "$file")

    # Check if a symbolic link with the same name already exists in /usr/opt
    if [[ -L "/usr/lib/cups/filter/$filename" ]]; then
        echo "Symbolic link $filename already exists in /usr/lib/cups/filter/"
    else
        # Create the symbolic link and set the permission to 755
        ln -s "$file" "/usr/lib/cups/filter/$filename"
        chmod 755 "/usr/lib/cups/filter/$filename"
        echo "Created symbolic link $filename in /usr/lib/cups/filter/"
    fi
done