# Sources
TEX_FILES = $(wildcard *.tex)
MAIN_TEX_FILE = main.tex

# Targets
MAIN_PDF = $(MAIN_TEX_FILE:.tex=.pdf)

all: $(MAIN_PDF)

main.pdf: $(TEX_FILES)
	lualatex $(MAIN_TEX_FILE)

clean:
	rm -f $(MAIN_PDF)
