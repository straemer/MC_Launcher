#!/bin/sh
BINDIR=$(dirname "$(readlink -fn "$0")")
AUTOHIDE=$(dconf read /org/compiz/profiles/unity/plugins/unityshell/launcher-hide-mode)
dconf write /org/compiz/profiles/unity/plugins/unityshell/launcher-hide-mode 1
TRIGGER=$(dconf read /org/compiz/profiles/unity/plugins/unityshell/reveal-trigger)
dconf write /org/compiz/profiles/unity/plugins/unityshell/reveal-trigger 1
RESPONSIVENESS=$(dconf read /org/compiz/profiles/unity/plugins/unityshell/edge-responsiveness)
dconf write /org/compiz/profiles/unity/plugins/unityshell/edge-responsiveness 0.0

java -Xmx10G -Xms4G -cp /usr/local/bin/minecraft.jar net.minecraft.LauncherFrame

dconf write /org/compiz/profiles/unity/plugins/unityshell/launcher-hide-mode $AUTOHIDE
dconf write /org/compiz/profiles/unity/plugins/unityshell/reveal-trigger $TRIGGER
dconf write /org/compiz/profiles/unity/plugins/unityshell/edge-responsiveness $RESPONSIVENESS
