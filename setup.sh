#!/bin/bash
#Set up the theme
rm -rf theme
mkdir theme
git clone https://github.com/startling/firebelly.git theme

#Set up dashboard
mkdir ~/.emacs.d/init.el/logo
cp ~/Github/EmacsInit/logo/emacs.png ~/.emacs.d/logo/

#Set up the c-ide
rm -rf ~/Documents/emacs_beckup/
mkdir ~/Documents/emacs_beckup
mv ~/.emacs.d ~/Documents/emacs_beckup
git clone https://github.com/tuhdo/emacs-c-ide-demo.git ~/.emacs.d
rm -rf ~/.emacs.d/init.el
echo "Copying the init.el file and the theme"
cp ~/Github/EmacsInit/init.el ~/.emacs.d/
cp ~/Github/EmacsInit/theme/firebelly-theme.el ~/.emacs.d/

