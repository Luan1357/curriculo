@echo off
REM Compila as duas versoes do curriculo (requer MiKTeX ou TeX Live no PATH).
for %%f in (LuanLugariniCV_PT LuanLugariniCV_EN) do (
  pdflatex -interaction=nonstopmode %%f.tex >nul
  pdflatex -interaction=nonstopmode %%f.tex >nul
)
del /q *.aux *.log *.out 2>nul
echo Pronto.
