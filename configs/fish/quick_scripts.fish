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

# MISC
alias dclean='docker system prune -a --volumes'
alias kayo='gdrive2 download --recursive --skip'
alias loff='xrandr --output eDP1 --off'
alias lonn='xrandr --output eDP1 --auto'
