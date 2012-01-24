#!/bin/bash

WPM=260
INFILE=$1
BASENAME=`basename -s .pdf $INFILE`
TXTFILE=/tmp/tmp.txt
SNDFILE=/tmp/tmp.m4a
MP3FILE=$BASENAME.mp3
TMPFILE=/tmp/tmpfile

echo "extracting text from $INFILE"
pdftotext "$INFILE" "$TXTFILE"
iconv -f ISO-8859-1 -t utf8 "$TXTFILE" > $TMPFILE

say -v Samantha -r $WPM --data-format=alac -o "$SNDFILE" -f $TMPFILE
ffmpeg -i "$SNDFILE" "$MP3FILE"

echo "wrote to $MP3FILE"
