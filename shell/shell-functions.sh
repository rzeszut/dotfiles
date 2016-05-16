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

isranger () {
    [[ -z "$RANGER_LEVEL" ]] && return 1 || return 0
}

use_java () {
    export JAVA_HOME=$1
    export PATH=$JAVA_HOME/bin:$PATH
    java -version
}

j7 () {
    use_java $JAVA7_HOME
}

j8 () {
    use_java $JAVA8_HOME
}

WEATHER_DEFAULT_CITY=Krakow
weather () {
    local city=${1:-$WEATHER_DEFAULT_CITY}
    curl --silent http://wttr.in/$city | head -7
}
