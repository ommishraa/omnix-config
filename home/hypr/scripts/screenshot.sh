!#/bin/zsh
grim -g "$(slurp)" - | tee >(wl-copy) | satty -f - --copy-command "wl-copy"
