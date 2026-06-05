TEX    = pdflatex
BIB    = bibtex
NAME   = daloc-whitepaper
FLAGS  = -interaction=nonstopmode -halt-on-error

SRCS   = $(NAME).tex preamble.tex $(wildcard sections/*.tex)

.PHONY: all build fmt lint check clean

all: $(NAME).pdf

$(NAME).pdf: $(SRCS) references.bib
	$(TEX) $(FLAGS) $(NAME)
	$(BIB) $(NAME)
	$(TEX) $(FLAGS) $(NAME)
	$(TEX) $(FLAGS) $(NAME)

build: clean all

fmt:
	tex-fmt --nowrap $(SRCS)

lint:
	chktex -q -l .chktexrc $(SRCS)

check: lint
	@$(MAKE) --no-print-directory all
	@echo "Build OK."

clean:
	rm -f $(NAME).{aux,bbl,blg,log,out,toc,pdf,nav,snm,vrb}
