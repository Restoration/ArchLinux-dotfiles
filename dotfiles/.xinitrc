#   _____                .__      .____    .__
#  /  _  \_______   ____ |  |__   |    |   |__| ____  __ _____  ___
# /  /_\  \_  __ \_/ ___\|  |  \  |    |   |  |/    \|  |  \  \/  /
#/    |    \  | \/\  \___|   Y  \ |    |___|  |   |  \  |  />    <
#\____|__  /__|    \___  >___|  / |_______ \__|___|  /____//__/\_ \
#        \/            \/     \/          \/       \/            \/
#
#                  -`
#                 .o+`
#                `ooo/
#               `+oooo:
#              `+oooooo:
#              -+oooooo+:
#            `/:-:++oooo+:
#           `/++++/+++++++:
#          `/++++++++++++++:
#         `/+++ooooooooooooo/`
#        ./ooosssso++osssssso+`
#       .oossssso-````/ossssss+`
#      -osssssso.      :ssssssso.
#     :osssssss/        osssso+++.
#    /ossssssss/        +ssssooo/-
#  `/ossssso+/:-        -:/+osssso+-
# `+sso+:-`                 `.-/+oso:
#`++:.                           `-/+/
#.`                                 `
#

#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then



    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


compton -b

#fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export DefaultIMModule=fcitx
fcitx-autostart

#exec startxfce4
exec awesome
#exec i3
