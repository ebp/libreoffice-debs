#!/bin/bash
#
# Generate a Packages file for an apt repo.
#
# Add the path to /etc/apt/sources.list:
#   deb file:/path/to/here/debs ./
#
dpkg-scanpackages debs > Packages
