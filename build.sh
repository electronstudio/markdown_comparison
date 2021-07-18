#!/usr/bin/env bash
cd asciidoc
./build.sh
cd ../pandoc
./build.sh
cd ../softcover
./build.sh
cd ../sphinx
./build.sh
cd ../sphinx-md-source
./build.sh