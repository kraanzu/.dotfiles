#!/bin/bash

# Read desired extensions from file, ignore empty lines
mapfile -t desired_extensions < <(grep -v '^\s*$' extensions.txt)

# Get currently installed extensions
mapfile -t installed_extensions < <(cursor --list-extensions)

# Install desired extensions
for ext in "${desired_extensions[@]}"; do
    cursor --install-extension "$ext"
done

# Uninstall extensions not in the desired list
for ext in "${installed_extensions[@]}"; do
    if [[ ! " ${desired_extensions[@]} " =~ " ${ext} " ]]; then
        cursor --uninstall-extension "$ext"
    fi
done
