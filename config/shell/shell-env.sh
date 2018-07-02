export JAVA7_HOME='/usr/lib/jvm/java-7-oracle'
export JAVA8_HOME='/usr/lib/jvm/java-8-oracle'
export JAVA9_HOME='/usr/lib/jvm/java-9-oracle'

export JAVA_HOME=$JAVA8_HOME

export MAVEN_OPTS='-Djava.net.preferIPv4Stack -Xmx1024m -XX:MaxMetaspaceSize=256m'

ANDROID_HOME='/home/mateusz/bin/android-sdk-linux'
if [[ -d $ANDROID_HOME ]] ; then
    export ANDROID_HOME
fi
CATALINA_HOME='/home/mateusz/bin/tomcat'
if [[ -d $CATALINA_HOME ]] ; then
    export CATALINA_HOME
fi

export EDITOR='emacsclient -t'
export GUI_EDITOR='emacsclient -c'
export TERMINAL='rxvt'
export TERM='rxvt'

