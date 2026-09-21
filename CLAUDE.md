# Dissertação de mestrado — Mateus Pinto da Silva (UFV)

Projeto LaTeX da dissertação de mestrado (PPGCC/UFV), exportado do Overleaf. Não é um repositório git.

## Estrutura
- `main_paper.tex` — a dissertação completa (classe `abntex2` + `abntex2-UFV.sty`, template UFV 2021).
- `main_presentation.tex` — slides de defesa (beamer, tema UFV via `preamble.tex`).
- `main_seminarios_presentation.tex` — slides de uma apresentação de seminários separada (não tem target no Makefile).
- `sections/`, `other/` — conteúdo da dissertação (`\include`d por `main_paper.tex`).
- `slides/` — conteúdo dos slides de defesa (`\input`ados por `main_presentation.tex`).
- `figures/`, `figures_slides/`, `logos_ufv/`, `logos_institutos/` — imagens.
- `pdfs/` — PDFs fonte incluídos via `\includepdf` (ficha catalográfica em branco, modelo de páginas de assinatura). **Não são artefatos de build — não apagar/regenerar.**
- `references.bib` — bibliografia (usada por `main_paper.tex` via natbib/bibtex; `main_presentation.tex` usa biblatex/biber mas não cita nada, então a ausência de `refs.bib` é só um warning inofensivo).

## Compilação

Só fazemos build em qualidade de release (latexmk completo + bibtex/biber + compressão ghostscript), nunca draft. Dois targets:

```
make              # dissertação completa -> dissertation.pdf
make presentation # slides de defesa -> presentation.pdf
```

`make clean` remove os intermediários do latexmk (aux/log/toc/...). `make distclean` também remove os `.pdf` finais.

O `main_seminarios_presentation.tex` não tem target — compilar manualmente com `latexmk -pdf main_seminarios_presentation.tex` se precisar dele.

## Cuidados ao editar `references.bib`

Entradas com acentos alemães (ü, ö, ä etc.) escapados incorretamente como `{\""}` em vez de `\"u`/`\"o` quebram a compilação: como o documento usa `natbib[authoryear]`, o `\citep` insere o sobrenome do autor literalmente no corpo do texto, e um `"` cru ativa o shorthand do babel para português (`brazil` está entre os idiomas do documento), gerando `! Argument of \language@active@arg" has an extra }.` em um ponto do texto que não tem nada a ver com a entrada quebrada. Se a compilação falhar com esse erro, o primeiro lugar a checar é `references.bib` — não o arquivo `.tex` apontado no log.

## Numeração de página

Havia um `\setcounter{page}{11}` em `main_paper.tex` logo antes da lista de figuras — um ajuste manual de numeração feito só para a submissão exigida pela biblioteca da UFV. Foi removido (2026-09-21); a numeração agora segue naturalmente a partir da folha de rosto.

## Idioma do corpo do texto

`abntex2.cls` ativa o idioma `brazil` do babel duas vezes internamente (dentro de `\imprimirfolhaderosto` e `\imprimirfolhadeaprovacao`, exigências da ABNT em português) e nunca volta pro inglês sozinho — isso fazia TOC, listas de figuras/tabelas, "Capítulo X" etc. saírem em português no resto do documento (dissertação é escrita em inglês). Corrigido (2026-09-21) com `\selectlanguage{english}` logo após `\imprimirfolhadeaprovacao` em `main_paper.tex`, antes de `\include{other/thanks}`. Capa e folha de aprovação continuam em português (corretamente, por exigência da ABNT); o resto do documento volta a ser inglês.

Também corrigido (2026-09-21) em `abntex2-UFV.sty`: "Coorientador:" (vinha do babel, em português) virou "Co-advisor:" hardcoded na folha de rosto — igual ao "Advisor:" ao lado, que já era hardcoded; e "Adviser" na folha de aprovação foi unificado para "Advisor" (mesma grafia usada na folha de rosto).

## Slides de defesa (`main_presentation.tex`)

Usa `\documentclass[handout]{beamer}` — modo único, sem transições/overlays. Cada `\pause`/`\only<n>` nos slides (`slides/*.tex`) vira 1 página só (estado final do frame), não uma página por passo de animação. Não reativar o modo sem `handout` sem pedido explícito.

## Limpeza (2026-09-21)

`.gitignore` criado (build artifacts do LaTeX/Overleaf + os `.pdf` gerados pelo Makefile — não são versionados, regenerar com `make`).

Removidos por serem órfãos/backups/superseded (confirmado com grep cruzando `\includegraphics`/`\includepdf`/`\input`/`\include` de todo o projeto contra os arquivos em disco antes de apagar): `sections/4_datasets.tex` (capítulo antigo duplicado, conteúdo já vive em `4_methodology_datasets.tex`), `appendix/` inteira (só tinha um `.tex` vazio, nunca incluído), `figures/99_slides_only/GRSL/` inteira (figuras de outro paper, não usadas aqui), `*_bak.pdf` em `figures/6_methodology/datasets/`, `hist_confidnet.pdf`/`hist_gmm.pdf`/`hist_mcp.pdf`/`from_scratch.pdf` nos 3 datasets de `figures/8_results/` (superseded por `hist_combined_test.pdf`/`line_training.pdf`, que são os usados), algumas imagens soltas de `figures/99_slides_only/` não referenciadas, `figures/6_methodology/agl.png` (superseded por `aglgis.png`), `figures/6_methodology/graphical_abstract_datasets.pdf`, `figures/3_theoretical_background/deep learning/flower_camp.png`, `logos_ufv/LogoUFV.png` (logo alternativo não usado, só `LogoSIN.png` é usado).

**Não apagados de propósito** mesmo estando "não referenciados" pelo LaTeX — são fontes editáveis ou documentos de referência, não lixo: os `.drawio` em `figures/1_introduction/` e `figures/3_theoretical_background/data_centric_ai/` (fonte editável de PDFs que são usados), os `.svg` em `figures/3_theoretical_background/deep learning/` e `shallow_learning/gmm.svg` (fonte editável dos `.pdf` usados), e `pdfs/Modelo-pgs-de-assinaturas.pdf` (documento de referência da biblioteca UFV, a folha de aprovação é montada em LaTeX, não por `\includepdf` deste arquivo).

## Versão markdown pra LLM (2026-09-21)

`figures/descriptions.md` — fonte, versionada — descrição em linguagem natural de cada figura que aparece de fato na dissertação compilada (legenda + descrição grounded na imagem real), organizada por capítulo. Existe uma seção separada no fim do arquivo pras 4 figuras que existem em disco mas estão com `\includegraphics` comentado no `.tex` (não aparecem no PDF): `aglgis.png` e os 3 `tsne_embeddings.pdf` (brazil/california/texas).

`dissertation-llm.md` — **não versionado** (no `.gitignore`), só existe como asset da release `v1.0` no GitHub. É a dissertação inteira (rosto, agradecimentos, epígrafe, abstract, capítulos 1-8, referências) convertida de LaTeX pra Markdown: siglas expandidas na primeira ocorrência, citações resolvidas via `references.bib` em formato (Autor, Ano), tabelas viraram tabelas Markdown de verdade, e cada figura foi substituída pelo bloco correspondente de `figures/descriptions.md`. A lista de referências no fim foi gerada automaticamente a partir do `.bbl` do bibtex (312 entradas, todas as citadas no texto). Pra regenerar: rebuildar cada capítulo manualmente seguindo o mesmo padrão (não existe script único, foi montado capítulo por capítulo).
