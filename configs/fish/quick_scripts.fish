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

function obsi --description "Copy Obsidian config from dotfiles into all vaults in ~/Obsidian"
    set -l src ~/.dotfiles/configs/obsidian
    set -l root ~/Obsidian

    if not test -d $src
        echo "obsi: config not found at $src"
        return 1
    end

    if not test -d $root
        echo "obsi: vault root not found at $root"
        return 1
    end

    for vault in (find $root -mindepth 1 -maxdepth 1 -type d -not -name '.*')
        mkdir -p $vault/.obsidian
        cp -r $src/. $vault/.obsidian/
        echo "obsi: copied config into $vault/.obsidian"
    end
end
