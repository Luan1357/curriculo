#!/bin/bash
# Compila as duas versoes do curriculo e gera as imagens de preview.
set -e
command -v pdflatex >/dev/null || { echo "pdflatex nao encontrado (instale TeX Live ou MiKTeX)."; exit 1; }
for f in LuanLugariniCV_PT LuanLugariniCV_EN; do
  pdflatex -interaction=nonstopmode "$f.tex" >/dev/null
  pdflatex -interaction=nonstopmode "$f.tex" >/dev/null
done
mkdir -p assets
if command -v pdftoppm >/dev/null; then
  pdftoppm -png -r 110 LuanLugariniCV_PT.pdf assets/cv-pt
  pdftoppm -png -r 110 LuanLugariniCV_EN.pdf assets/cv-en
fi
rm -f *.aux *.log *.out
echo "Pronto: LuanLugariniCV_PT.pdf e LuanLugariniCV_EN.pdf"
