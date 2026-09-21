LATEXMK := latexmk
GS := gs

DISSERTATION := main_paper
PRESENTATION := main_presentation

DISSERTATION_PDF := dissertation.pdf
PRESENTATION_PDF := presentation.pdf

LATEXMK_FLAGS := -pdf -interaction=nonstopmode -halt-on-error -file-line-error
GS_FLAGS := -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH

.PHONY: all presentation clean distclean

all: $(DISSERTATION_PDF)

presentation: $(PRESENTATION_PDF)

$(DISSERTATION_PDF): $(DISSERTATION).tex
	$(LATEXMK) $(LATEXMK_FLAGS) $(DISSERTATION).tex
	$(GS) $(GS_FLAGS) -sOutputFile=$@ $(DISSERTATION).pdf

$(PRESENTATION_PDF): $(PRESENTATION).tex
	$(LATEXMK) $(LATEXMK_FLAGS) $(PRESENTATION).tex
	$(GS) $(GS_FLAGS) -sOutputFile=$@ $(PRESENTATION).pdf

clean:
	$(LATEXMK) -c $(DISSERTATION).tex
	$(LATEXMK) -c $(PRESENTATION).tex

distclean:
	$(LATEXMK) -C $(DISSERTATION).tex
	$(LATEXMK) -C $(PRESENTATION).tex
	rm -f $(DISSERTATION_PDF) $(PRESENTATION_PDF)
