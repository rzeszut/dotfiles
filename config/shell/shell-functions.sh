# Check if command is executable
# 0 is True, 1 is False -- 0 is a normal return code
is_executable () {
    [[ ! -z `command -v $1` ]] && return 0 || return 1
}
is_not_executable () {
    [[ -z `command -v $1` ]] && return 0 || return 1
}

prompt () {
    local question=$1
    if [[ ! -z "$ZSH_VERSION" ]]; then
        read -k1 -s "answer?$question [y/N]"
    else
        read -n1 -s -p "$question [y/N]" answer
    fi
    echo ''
    case $answer in
        y|Y)
            return 0
            ;;

        *)
            return 1
            ;;
    esac
}

# A set of functions for manipulating fonts
font_normal () {
    echo -n -e "\033[0m"
}
font_red () {
    echo -n -e "\033[1;31m"
}
font_green () {
    echo -n -e "\033[1;32m"
}
font_blue () {
    echo -n -e "\033[1;34m"
}
font_yellow () {
    echo -n -e "\033[1;33m"
}

echo_red () {
    font_red; echo $@; font_normal
}
echo_green () {
    font_green; echo $@; font_normal
}
echo_blue () {
    font_blue; echo $@; font_normal
}
echo_yellow () {
    font_yellow; echo $@; font_normal
}

# Utility functions
rmtrash () {
    find $HOME/.local/share/Trash/files -mindepth 1 -exec rm -r "{}" \;
    find $HOME/.local/share/Trash/info  -mindepth 1 -exec rm -r "{}" \;
}

isranger () {
    [[ -z "$RANGER_LEVEL" ]] && return 1 || return 0
}

use_java () {
    if [[ -d $1 ]]; then
        export JAVA_HOME=$1
        export PATH=$JAVA_HOME/bin:$PATH
        java -version
    fi
}

j7 () {
    use_java $JAVA7_HOME
}
j8 () {
    use_java $JAVA8_HOME
}
j9 () {
    use_java $JAVA9_HOME
}

WEATHER_DEFAULT_CITY=Krakow
weather () {
    local city=${1:-$WEATHER_DEFAULT_CITY}
    curl --silent http://wttr.in/$city | head -7
}
