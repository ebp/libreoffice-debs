#!/bin/bash
#
# Replace alpha1-1 with alpha1 in version numbers of generated packages.
# Destroys alpha1-1 deb files in debs/ after complete.
#
for deb in debs/*.deb; do
	new=$(echo $deb | perl -pe 's(alpha1\-1)(alpha1)')
	dir="$(basename $deb .deb)"
	mkdir -p "$dir"
	dpkg-deb -x "$deb" "$dir"
	dpkg-deb --control "$deb" "$dir/DEBIAN"
	perl -i -pe 's(alpha1\-1)(alpha1)g' "$dir/DEBIAN/control"
	dpkg -b "$dir" "$new"
	rm -fr "$dir"
done

rm -f debs/*alpha1-1*.deb
