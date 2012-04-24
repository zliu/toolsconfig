url=`grep URL downloadURL | sed "s/^URL=\(.*\)/\1/"`
target=`grep TARGET downloadURL | sed "s/^TARGET=\(.*\)/\1/"`
wget $url -O $target
