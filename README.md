Installation:

    cd 
    git clone https://github.com/thatjpk/dot-vimrc.git
    cd dot-vimrc/.vim
    mkdir backups
    mkdir bundle
    git clone https://github.com/gmarik/vundle.git bundle/vundle
    cd
    ln -s dot-vimrc/.vimrc
    ln -s dot-vimrc/.vim
    vim +BundleInstall +qall
    echo Justice prevails this day.
