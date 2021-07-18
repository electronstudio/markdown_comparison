#!/usr/bin/env bash
asciidoctor-pdf -n -a pdf-theme=./default-for-print-theme.yml tutorial.adoc -o ../asciidoc-asciidoctor.pdf
