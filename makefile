# Sources
TEX_FILES = $(wildcard **/*.tex)
MAIN_TEX_FILE = main.tex
FIGURES = $(wildcard figures/*.png)

# Targets
MAIN_PDF = $(MAIN_TEX_FILE:.tex=.pdf)

all: $(MAIN_PDF)

$(MAIN_PDF): $(TEX_FILES) $(FIGURES)
	lualatex $(MAIN_TEX_FILE)
	biber $(MAIN_TEX_FILE:.tex=)
	lualatex $(MAIN_TEX_FILE)
	lualatex $(MAIN_TEX_FILE)

clean:
	rm -f \
		*.aux \
		*.log \
		*.toc \
		*.pdf \
		*.bcf \
		*.xml \
		*-blx.bib \
		*.bbl \
		*.blg

# Utilities

update_bib:
	gh workflow run update_bib.yaml
