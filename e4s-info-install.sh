#!/bin/sh

mkdir -p /usr/local/bin/
cp -r e4s-info-command/* /usr/local/bin/
mkdir -p /usr/share/man/man1/
cp e4s-info-manual/e4s-info.1.gz /usr/share/man/man1/
