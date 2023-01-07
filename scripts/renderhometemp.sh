#!/bin/sh
cd /home/spk/DATA/hometemp/reports
if [ -f hometemp.html ]; then
  rm -f hometemp.html
fi
$HOME/bin/qrender hometemp.qmd
if [ -f hometemp.html ]; then
  cp hometemp.html $HOME/public_html/reports/
fi


