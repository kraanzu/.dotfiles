# compile and run c/c++
function com
    g++ $argv[1] && ./a.out
end

# git diff for last commit
function gdiff
    set COMMIT $argv[1]
    git diff $COMMIT~ $COMMIT
end

# push to android
function apush
    adb push $argv[1] /sdcard/AAA
end

function mf
    smem -c "name pss" -s pss -r | awk 'NR>1 {
      name=$1
      sub(/^\./, "", name)
      sub(/-wrap.*$/, "", name)
      mem[name]+=$2
    } END {for (p in mem) printf "%-30s %.0f MB\n", p, mem[p]/1024}' | sort -k2 -rn | head -10
end

function torr
    qbittorrent --skip-dialog=true --save-path=$PWD $argv
end

function obsi --description "Copy Obsidian config from dotfiles into current vault"
    set -l src ~/.dotfiles/configs/obsidian

    if not test -d $src
        echo "obsi: config not found at $src"
        return 1
    end

    if test "$PWD" = "$HOME"; or test "$PWD" = (realpath $src)
        echo "obsi: refusing to run in $PWD"
        return 1
    end

    mkdir -p .obsidian
    cp -r $src/. .obsidian/
    echo "obsi: copied config into $PWD/.obsidian"
end
