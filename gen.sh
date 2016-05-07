#!/bin/sh

mkdir -p sable wav mp3 txt

x=$1

echo "Generating $x"
../geyik/geyik.byte -random-self-init nts.bnf >sable/msg-$x.sable
sed -e 's@<AUDIO SRC="file:///tmp/blank.wav"/>@ @g' sable/msg-$x.sable|grep -v '^<'|sed -e 's/  */ /g' -e 's/^ *//' -e 's/ *$//'>txt/msg-$x.txt
text2wave sable/msg-$x.sable -o wav/msg-$x.wav
lame wav/msg-$x.wav mp3/msg-$x.mp3
