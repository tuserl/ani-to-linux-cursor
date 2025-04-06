#!/bin/bash

# Path to the folder where the .ani files are located
TARGET_DIR="./ani/"    # Adjust the directory as needed
OUTPUT_DIR="./output/" # Adjust the directory as needed

# Loop through each .ani file in the directory
for ani_file in "$TARGET_DIR"/*.ani; do
  # Check if the file exists
  if [ -f "$ani_file" ]; then
    # Get the base filename without extension (to use for folder name)
    base_name=$(basename "$ani_file" .ani)

    # Create a folder for the generated .ico files (if it doesn't exist)
    mkdir -p "$OUTPUT_DIR/$base_name"

    # Run the command to generate .ico file(s)
    ./ani2ico.out "$ani_file"

    # Move all the generated .ico files into the corresponding folder
    for ico_file in "$TARGET_DIR"/*.ico; do
      if [[ "$ico_file" == *"$base_name"* ]]; then
        mv "$ico_file" "$OUTPUT_DIR/$base_name/"
        echo "Moved $ico_file to $OUPUT_DIR/$base_name/"
      fi
    done
  fi
done
