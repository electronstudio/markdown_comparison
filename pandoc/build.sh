#!/usr/bin/env bash
pandoc tutorial.md --filter pandoc-emphasize-code -o ../pandown-pandoc-eisvogel.pdf --from markdown --number-sections --top-level-division=chapter --toc --syntax-definition gd-script.xml --highlight-style=tango  --template eisvogel --pdf-engine xelatex
pandoc tutorial.md --filter pandoc-emphasize-code -o ../pandown-pandoc.pdf --from markdown --number-sections --top-level-division=chapter --toc --syntax-definition gd-script.xml --highlight-style=tango  --pdf-engine xelatex
