#!/bin/sh
# Copyright 2013 Stephen Kraemer
# This file is part of MC_Launcher.

# MC_Launcher is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# MC_Launcher is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with MC_Launcher.  If not, see <http://www.gnu.org/licenses/>.
BINDIR=$(dirname "$(readlink -fn "$0")")
AUTOHIDE=$(dconf read /org/compiz/profiles/unity/plugins/unityshell/launcher-hide-mode)
dconf write /org/compiz/profiles/unity/plugins/unityshell/launcher-hide-mode 1
TRIGGER=$(dconf read /org/compiz/profiles/unity/plugins/unityshell/reveal-trigger)
dconf write /org/compiz/profiles/unity/plugins/unityshell/reveal-trigger 1
RESPONSIVENESS=$(dconf read /org/compiz/profiles/unity/plugins/unityshell/edge-responsiveness)
dconf write /org/compiz/profiles/unity/plugins/unityshell/edge-responsiveness 0.0

java -Xmx10G -Xms4G -cp $1 net.minecraft.LauncherFrame

dconf write /org/compiz/profiles/unity/plugins/unityshell/launcher-hide-mode $AUTOHIDE
dconf write /org/compiz/profiles/unity/plugins/unityshell/reveal-trigger $TRIGGER
dconf write /org/compiz/profiles/unity/plugins/unityshell/edge-responsiveness $RESPONSIVENESS
