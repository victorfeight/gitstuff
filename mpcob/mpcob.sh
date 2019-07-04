#!/bin/sh
# mpcob - control mpc in your openbox menu
# 02/03/10 - supulton - vrfeight3@gmail.com
# chmod +x mpcob.sh, and place:
# "<menu id="pipe-mpc-menu" label="music" execute="/path/to/script/mpcob.sh" />"
# somewhere in your menu.

# replace "urxvtc" with your preferred terminal
set_term=`echo urxvt`

# gui mpd preference?
set_player=`echo sonata`

#set variables
playing=`mpc -f "%track%. %artist% - %title%" | sed -n '1p'`
nowstatus=`mpc | sed -n '2p' | cut -d ' ' -f1`
repeat=`mpc | tail -n 1 | cut -c 15-25`
random=`mpc | tail -n 1 | cut -c 29-39`
single=`mpc | tail -n 1 | cut -c 43-53`
consume=`mpc | tail -n 1 | cut -c 57-`
 
# tell when mpc is stopped

if [ "$nowstatus" != "[playing]" -a "$nowstatus" != "[paused]" ]
then
export nowstatus=`echo "[stopped]"`
fi
 
if [ "$nowstatus" = "[stopped]" ]
then
export playing=`echo play`
fi
 
# convert reserved XML characters '&', '<', '>', '"' for songs containing characters

if [[ $playing =~ '&' ]]
then
export playing=${playing//\&/\&amp\;}
fi
 
if [[ $playing =~ '<' ]]
then
export playing=${playing//\</\&lt\;}
fi
 
if [[ $playing =~ '>' ]]
then
export playing=${playing//\>/\&gt\;}
fi
 
if [[ $playing =~ '"' ]]
then
export playing=${playing//\"/\&quot\;}
fi

# the playlist browse section can cause the pipemenu to be slow for 
# long playlists...
# echo menu
 
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
echo "<openbox_pipe_menu>"
echo " <menu id=\"mpcob-playing\" label=\"$nowstatus\">"
echo " <item label=\"$playing\"> "
echo " <action name=\"Execute\"><execute>mpc toggle</execute></action>"
echo " </item>"
echo " <separator />"
echo " <item label=\"$set_player\"> "
echo " <action name=\"Execute\"><execute>sonata</execute></action>"
echo " </item>"
echo " <item label=\"ncmpcpp\"> "
echo " <action name=\"Execute\"><execute>$set_term -e ncmpcpp</execute></action>"
echo " </item>"
echo " </menu>" 
# Playlist Browse Section - mechoid9
mpc playlist 1>/tmp/playlist.txt
PlayList=`echo /tmp/playlist.txt`
 echo " <separator />"
 echo " <menu id=\"mpcob-search-playlist\" label=\"[browse playlist]\">"
 i=1
 while read LINE
 do
   POS=$(mpc playlist | grep -n "$LINE" | awk -F: '{print $1}')
   echo " <item label=\"$LINE\"> "
   echo " <action name=\"Execute\"><execute>mpc play $POS</execute></action> "
   echo " </item> "
 done < $PlayList
 echo " </menu>" 
echo " <separator />"
echo " <item label=\"play/pause\">"
echo " <action name=\"Execute\"><execute>mpc toggle</execute></action>"
echo " </item>"
echo " <item label=\"prev\">"
echo " <action name=\"Execute\"><execute>mpc prev</execute></action>"
echo " </item>"
echo " <item label=\"next\">"
echo " <action name=\"Execute\"><execute>mpc next</execute></action>"
echo " </item>"
echo " <item label=\"stop\">"
echo " <action name=\"Execute\"><execute>mpc stop</execute></action>"
echo " </item>"
echo " <separator />"
echo " <menu id=\"mpcob-options\" label=\"options\">"
echo " <item label=\"$random\">"
echo " <action name=\"Execute\"><execute>mpc random</execute></action>"
echo " </item>"
echo " <item label=\"$repeat\">"
echo " <action name=\"Execute\"><execute>mpc repeat</execute></action>"
echo " </item>"
echo " <item label=\"$consume\">"
echo " <action name=\"Execute\"><execute>mpc consume</execute></action>"
echo " </item>"
echo " <item label=\"$single\">"
echo " <action name=\"Execute\"><execute>mpc single</execute></action>"
echo " </item>"
echo " <separator />"
echo " <item label=\"update\">"
echo " <action name=\"Execute\"><execute>mpc update</execute></action>"
echo " </item>"
echo " </menu>"
echo "</openbox_pipe_menu>"
