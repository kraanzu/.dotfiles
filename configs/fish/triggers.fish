function react_to_pwd --on-variable PWD
    if test -d "$PWD/.venv"
        source "$PWD/.venv/bin/activate.fish"
    end
    starship init fish | source
end

react_to_pwd # auto trigger on startup
