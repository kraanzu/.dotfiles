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

# MISC
alias dclean='docker system prune -a --volumes'
alias kayo='gdrive files download --recursive --overwrite --destination ~/HDD/watch/'
