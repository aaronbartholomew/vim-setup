mkdir ~/.fonts
cd ~/.fonts
wget http://www.proggyfonts.net/wp-content/download/ProggyClean.ttf.zip
unzip ProggyClean.ttf.zip
wget http://www.proggyfonts.net/wp-content/download/ProggySmall.ttf.zip
unzip ProggySmall.ttf.zip
ttmkfdir -o fonts.dir
fc-cache -f -v
