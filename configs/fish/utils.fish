function ext
    set destination $argv[-1]

    for file in $argv[1..-2]
        if string match -q '*.tar' $file
            tar -xf $file -C $destination
        else if string match -q '*.tar.gz' $file
            tar -xzf $file -C $destination
        else if string match -q '*.tgz' $file
            tar -xzf $file -C $destination
        else if string match -q '*.zip' $file
            unzip $file -d $destination
        else if string match -q '*.rar' $file
            unrar x $file $destination
        else
            echo "Unsupported archive type for file: $file"
        end
    end
end

# merge develop branch and push
function mmm
    git checkout main
    git merge develop
    git push
    git checkout develop
end

function shell
  if test -d .venv
    source .venv/bin/activate.fish
  else
    python3 -m venv .venv
    source .venv/bin/activate.fish
end
