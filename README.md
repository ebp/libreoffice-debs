LibreOffice built from source
=============================

This repo contains built .deb packages for Ubuntu 12.04 x64.


Installation
------------
```sh
# fetch this repo
git clone git://github.com/ebp/libreoffice-debs.git /usr/local/src/libreoffice-debs
cd /usr/local/src/libreoffice-debs

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
# git clone git://anongit.freedesktop.org/libreoffice/core libreoffice-core

cd libreoffice-core
git submodule init
git submodule update

# run the configure script - Ubuntu's doxygen is too old
./autogen.sh --with-distro=LibreOfficeLinux --without-doxygen --disable-kde --enable-epm --with-package-format=deb

# build
make
```

After a successful `make`, the generated debs should be roughly in:
```
./workdir/installation/LibreOffice_Dev/deb/install/LibreOfficeDev_4.3.0.0.alpha0_Linux_x86-64_deb/DEBS/
```

`cd` there and copy to this folder:
```
cp *.deb /usr/local/src/libreoffice-debs/debs/
```

This may not be necessary:
The generated debs versioned `alpha1-1` won't properly install, so change them,
then regenerate `Packages`:
```sh
./reversion-debs.sh
./update-packages.sh
```
