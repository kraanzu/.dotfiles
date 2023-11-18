# extract automatically
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

# config files
function conf
    set val $argv[1]

    if [ $val = fish ]
        nvim ~/.config/fish/config.fish

    else if [ $val = starship ]
        nvim ~/.config/starship.toml

    else if [ $val = qtile ]
        nvim ~/.config/qtile/config.py

    else if [ $val = alacritty ]
        nvim ~/.config/alacritty/alacritty.yml

    else if [ $val = picom ]
        nvim ~/.config/picom/picom.conf

    else if [ $val = vim ]
        nvim ~/.config/nvim/init.vim
    else
        echo Not in the config list!!
    end
end

# merge develop branch and push
function mmm
    git checkout main
    git merge develop
    git push
    git checkout develop
end
