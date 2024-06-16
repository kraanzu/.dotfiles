function react_to_pwd --on-variable PWD
    if test -d "$PWD/.venv"
        source "$PWD/.venv/bin/activate.fish"
    end
end
