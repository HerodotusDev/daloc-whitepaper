# DALOC Whitepaper

Whitepaper for **DALOC** — a cross-chain prime brokerage platform for collateralized credit.

## Prerequisites

- TeX Live (`pdflatex`, `bibtex`)
- [tex-fmt](https://github.com/WGUNDERWOOD/tex-fmt) — `cargo install tex-fmt`
- [ChkTeX](https://www.nongnu.org/chktex/) — `sudo dnf install chktex`

## Usage

```
make            # build daloc-whitepaper.pdf
make fmt        # format all .tex sources
make lint       # lint all .tex sources
make check      # lint + build
make clean      # remove build artifacts
```

## Structure

```
daloc-whitepaper.tex    main document (title page + section inputs)
preamble.tex            packages, macros, style
sections/               one file per section, numbered for reading order
references.bib          bibliography
```
