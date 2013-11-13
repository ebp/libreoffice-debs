LibreOffice built from source
=============================

This repo contains built .deb packages for Ubuntu 12.04 x64.


Installation
------------
```sh
# fetch this repo
git clone git://github.com/ebp/libreoffice-debs.git /usr/local/src/libreoffice-debs
cd /usr/local/src/libreoffice-debs

# generate a Packages file to use as an apt repository
./update-apt-repo.sh

# add to apt sources
echo 'deb file:/usr/local/src/libreoffice-debs ./' | sudo tee -a /etc/apt/sources.list

# update apt and install
sudo apt-get update
sudo apt-get install libreofficedev4.2
```

Building
--------
```sh
# get build dependencies
sudo apt-get build-dep libreoffice
sudo apt-get install libgnome-vfsmm-2.6-dev

# fetch the source - GitHub mirror, fast
git clone git://github.com/LibreOffice/core.git libreoffice-core
# or: fetch the source - official, slow
git clone git://anongit.freedesktop.org/libreoffice/core libreoffice-core

cd libreoffice-core

# run the build script
# ./autogen.sh --enable-epm --with-package-format=deb --without-doxygen
./autogen.sh --enable-epm --with-package-format=deb --with-distro=LibreOfficeLinux
```
