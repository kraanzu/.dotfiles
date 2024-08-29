function react_to_pwd --on-variable PWD
    # Check if we are already inside a nix-shell
    if test "$IN_NIX_SHELL" = "impure"
        return
    end

    # Check if `shell.nix` exists in the current directory
    if not test -e "$PWD/shell.nix"
        return
    end

    # Start `nix-shell` and run Fish
    nix-shell --run "fish"
end

# Call the function to handle the current directory
react_to_pwd

