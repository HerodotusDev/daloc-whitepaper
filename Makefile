NAME = daloc-whitepaper
SRCS = $(NAME).tex preamble.tex $(wildcard sections/*.tex)
LOG  = $(NAME).mklog

.PHONY: all build watch fmt lint check clean rebuild

all: build

build:
	@latexmk -silent $(NAME) > $(LOG) 2>&1 || { cat $(LOG); rm -f $(LOG); exit 1; }
	@rm -f $(LOG)

watch:
	@latexmk -pvc $(NAME)

rebuild:
	@$(MAKE) --no-print-directory clean
	@$(MAKE) --no-print-directory build

fmt:
	@tex-fmt --nowrap $(SRCS)

lint:
	@chktex -q -l .chktexrc $(SRCS)

check:
	@$(MAKE) --no-print-directory lint
	@$(MAKE) --no-print-directory build
	@echo "Build OK."

clean:
	@latexmk -silent -C $(NAME) > /dev/null 2>&1; rm -f $(NAME).bbl $(NAME).run.xml $(LOG)
