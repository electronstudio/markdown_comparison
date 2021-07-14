#!/usr/bin/env bash
#pandoc -t asciidoc -f markdown tutorial.md > tutorial.adoc
asciidoctor-pdf -n -a pdf-theme=./default-for-print-theme.yml tutorial.adoc -o ../asciidoc.pdf
