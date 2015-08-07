# 0 is True, 1 is False -- 0 is a normal return code
is_executable () {
    [[ ! -z `command -v $1` ]] && return 0 || return 1
}
is_not_executable () {
    [[ -z `command -v $1` ]] && return 0 || return 1
}

rmtrash () {
    find $HOME/.local/share/Trash/files -mindepth 1 -exec rm -r "{}" \;
    find $HOME/.local/share/Trash/info  -mindepth 1 -exec rm -r "{}" \;
}

