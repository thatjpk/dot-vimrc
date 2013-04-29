Installation:

    cd 
    git clone https://github.com/thatjpk/dot-vimrc
    cd dot-vimrc/.vim
    mkdir backups
    mkdir bundle
    git clone https://github.com/gmarik/vundle.git bundle/vundle
    vim +BundleInstall +qall
    cd
    ln -s dot-vimrc/.vimrc
    ln -s dot-vimrc/.vim
    echo Justice prevails this day.
