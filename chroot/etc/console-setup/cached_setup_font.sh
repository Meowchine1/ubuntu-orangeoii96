#!/bin/sh



if ls /dev/fb* >/dev/null 2>/dev/null; then
    for i in /dev/vcs[0-9]*; do
        { :
            
        } < /dev/tty${i#/dev/vcs} > /dev/tty${i#/dev/vcs}
    done
fi

mkdir -p /run/console-setup
> /run/console-setup/font-loaded
for i in /dev/vcs[0-9]*; do
    { :
printf '\033%%@' 
    } < /dev/tty${i#/dev/vcs} > /dev/tty${i#/dev/vcs}
done
