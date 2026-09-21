# A Lightweight Pipeline for Parcel-level Crop Classification via Data Centrism and Self-Supervision

Master's dissertation — Graduate Program in Computer Science (PPGCC), Universidade Federal de Viçosa (UFV), 2026.

**Author:** Mateus Pinto da Silva
**Advisor:** Hugo Neves de Oliveira
**Co-advisor:** Jefersson Alex dos Santos

## Abstract

This dissertation proposes and benchmarks a lightweight pipeline for large-scale, parcel-level crop classification from satellite image time series (SITS). It contributes a scalable SITS download strategy released as an open-source Python library ([AgriGEE.lite](https://github.com/mateuspinto/AgriGEE.lite)), three novel parcel-level crop classification datasets (Texas, California, and Brazil), a benchmark of shallow and deep classifiers under varying label-scarcity regimes with self-supervised pretraining, and **ORDER** (Open-set Recognition for Discriminative Error Rebuttal), a post-hoc anomaly detection method that flags likely-incorrect predictions without retraining. Deep models pretrained with self-supervised learning consistently outperform shallow and from-scratch baselines, especially in few-shot regimes, and ORDER improves classification metrics across all deep-model experiments.

**Keywords:** Crop Classification · Satellite Image Time Series · Anomaly Detection · Self-Supervised Learning · Open-set Recognition

## Repository structure

- `main_paper.tex` — the dissertation (abnTeX2 / UFV template).
- `main_presentation.tex` — defense slides (beamer).
- `sections/`, `other/`, `slides/` — chapter and slide content.
- `figures/`, `figures_slides/` — figures.
- `references.bib` — bibliography.

See [`CLAUDE.md`](CLAUDE.md) for build internals and notes for future edits.

## Building

Requires a TeX Live distribution (`latexmk`, `pdflatex`, `bibtex`) and Ghostscript.

```sh
make              # dissertation -> dissertation.pdf
make presentation # defense slides -> presentation.pdf
```

Pre-built PDFs are also available on the [Releases](../../releases) page.
