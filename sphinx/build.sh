#!/usr/bin/env bash
make latexpdf
cp _build/latex/godothighscoretutorial.pdf ../rst-sphinx.pdf
pandoc tutorial.rst --filter pandoc-emphasize-code -o ../rst-pandoc-eisvogel.pdf --from rst --number-sections  --toc --syntax-definition gd-script.xml --highlight-style=tango  --metadata-file=meta.yaml --template eisvogel --pdf-engine xelatex --top-level-division=chapter