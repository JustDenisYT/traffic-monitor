#!/bin/bash
SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
MONTAGE=`which montage`
VNSTATI=`which vnstati`
MUTT=`which mutt`
DATE=`date +%d.%m.%Y`
 
### CONFIG START ###
INTERFACES=(eth0)
MAILTO=walther_denis@gmx.de
#### CONFIG END ####
 
for i in "${INTERFACES[@]}"
do
    rm  ~/out-vnstati_*.png > /dev/null 2>&1
    $VNSTATI -i $i -d -o ~/out-vnstati_d_$i.png
    $VNSTATI -i $i -m -o ~/out-vnstati_m_$i.png
    $VNSTATI -i $i -s -o ~/out-vnstati_s_$i.png
    $VNSTATI -i $i -t -o ~/out-vnstati_t_$i.png
    $MONTAGE -mode concatenate -tile 2x2 ~/out-vnstati_*.png ~/out-vnstati_collage.png
    echo | $MUTT -s "Traffic Report, Interface $i - $DATE" $MAILTO -a ~/out-vnstati_collage.png
done
rm  ~/out-vnstati_*.png > /dev/null 2>&1
