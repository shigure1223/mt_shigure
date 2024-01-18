# Sources
TEX_FILES = $(wildcard **/*.tex)
MAIN_TEX_FILE = main.tex
FIGURES = $(wildcard figures/*.png)
BIB_FILE = references.bib

# Targets
MAIN_PDF = $(MAIN_TEX_FILE:.tex=.pdf)

# If DRAFT is set to 1, the draft mode will be enabled
export DRAFT := 0

all: $(MAIN_PDF)

$(MAIN_PDF): $(MAIN_TEX_FILE) $(TEX_FILES) $(FIGURES) $(BIB_FILE)
	lualatex --interaction=nonstopmode $(MAIN_TEX_FILE)
	biber $(MAIN_TEX_FILE:.tex=)
	lualatex --interaction=nonstopmode $(MAIN_TEX_FILE)
	lualatex --interaction=nonstopmode $(MAIN_TEX_FILE)

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
