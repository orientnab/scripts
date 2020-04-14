#! /bin/sh

EXTENSION=jpg
NATGEO_DIR=$HOME'/Pictures/NatGeo/'
WP_DIR=$HOME'/Pictures/Wallpaper/'

# Extracting the pics url and filename
PIC_URL=$( python3 ~/bin/picOfTheDayNatGeo.py | \
    sed -e 's/\(.*\)\.ngsversion.*$/\1.'$EXTENSION'/' )
PIC_FILE=$( sed -e 's/^.*\///g' <<< $PIC_URL )

# Downloading the file and creating a symlink in the wallpaper folder
[ ! -f $NATGEO_DIR$PIC_FILE ] && \
    wget -P $NATGEO_DIR $PIC_URL && \
    ln -s -f $NATGEO_DIR$PIC_FILE $WP_DIR'wallpaper.'$EXTENSION || true

# Stupidly long crap to change KDE background
WALLPAPERDIR=$WP_DIR
qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript 'var allDesktops = desktops();
print (allDesktops);for (i=0;i<allDesktops.length;i++) {
d = allDesktops[i];d.wallpaperPlugin = "org.kde.slideshow";
d.currentConfigGroup = Array("Wallpaper", "org.kde.slideshow", "General");
d.writeConfig("SlidePaths", "'${WALLPAPERDIR}'")}'
