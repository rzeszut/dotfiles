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

# Check if command is executable
# 0 is True, 1 is False -- 0 is a normal return code
is_executable () {
    [[ ! -z `command -v $1` ]] && return 0 || return 1
}
is_not_executable () {
    [[ -z `command -v $1` ]] && return 0 || return 1
}

# Prompt function, can specify what happens before and after -- useful for coloring
prompt () {
    local question=$1
    local before=$2
    local after=$3

    if [[ ! -z "$before" ]]; then
        $before
    fi

    if [[ ! -z "$ZSH_VERSION" ]]; then
        read -k1 -s "answer?$question [y/N]"
    else
        read -n1 -s -p "$question [y/N]" answer
    fi

    if [[ ! -z "$after" ]]; then
        $after
    fi

    echo
    case $answer in
        y|Y)
            return 0
            ;;

        *)
            return 1
            ;;
    esac
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

# Do not use proxy in this shell session
noproxy () {
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset socks_proxy
    unset no_proxy
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset FTP_PROXY
    unset SOCKS_PROXY
    unset NO_PROXY
}

extract () {
    local file=$1

    if [[ ! -f $file ]]; then
        echo "Invalid file $file"
        return 1
    fi

    case $file in
        *.zip)
            unzip $file
            ;;
        *.rar)
            unrar x $file
            ;;
        *.7z)
            7z x $file
            ;;
        *.tar.gz|*.tgz)
            tar xvzf $file
            ;;
        *.tar.bz2|*.tbz2)
            tar xvjf $file
            ;;
        *.gz)
            gunzip $file
            ;;
        *.bz2)
            bunzip2 $file
            ;;

        *)
            echo "Unsupported file format"
            return 2
            ;;
    esac
}

