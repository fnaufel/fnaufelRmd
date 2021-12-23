#' Custom PDF template for books
#'
#' Loads additional style and configs
#'
#' @title pdf_book
#'
#' @param toc see [bookdown::pdf_book]
#' @param number_sections see [bookdown::pdf_book]
#' @param fig_caption see [bookdown::pdf_book]
#' @param pandoc_args see [bookdown::pdf_book]
#' @param base_format see [bookdown::pdf_book]
#' @param toc_unnumbered see [bookdown::pdf_book]
#' @param toc_appendix see [bookdown::pdf_book]
#' @param toc_bib see [bookdown::pdf_book]
#' @param quote_footer see [bookdown::pdf_book]
#' @param highlight_bw see [bookdown::pdf_book]
#' @param df_print see [bookdown::pdf_book]
#' @param keep_tex see [bookdown::pdf_book]
#' @param latex_engine see [bookdown::pdf_book]
#' @param citation_package see [bookdown::pdf_book]
#' @param includes see [bookdown::pdf_book]
#' @param md_extensions see [bookdown::pdf_book]
#' @param template see [bookdown::pdf_book]
#' @param ... see [bookdown::pdf_book]
#'
#' @return see [bookdown::pdf_book]
#'
#' @importFrom rmarkdown pdf_document
#' @importFrom bookdown pdf_book
#'
#' @author fnaufel
#'
#' @export
#'
pdf_book <- function(
  toc = TRUE,
  number_sections = TRUE,
  fig_caption = TRUE,
  pandoc_args = c(
    '--variable=link-as-notes',
    paste0(
      '--variable=',
      'resources:',
      system.file('rmarkdown/resources', package = 'fnaufelRmd')
    ),
    '--variable=subparagraph',
    paste0(
      '--filter=',
      system.file(
        "rmarkdown/resources/pandoc_filters/dollar.py3",
        package = "fnaufelRmd"
      )
    ),
    paste0(
      '--filter=',
      system.file(
        "rmarkdown/resources/pandoc_filters/hl.py3",
        package = "fnaufelRmd"
      )
    )
  ),
  base_format = rmarkdown::pdf_document,
  toc_unnumbered = TRUE,
  toc_appendix = TRUE,
  toc_bib = TRUE,
  quote_footer = NULL,
  highlight_bw = FALSE,
  df_print = 'tibble',
  keep_tex = TRUE,
  latex_engine = 'xelatex',
  citation_package = 'natbib',
  includes = rmarkdown::includes(
    in_header = system.file(
      "rmarkdown/resources/tex/bd-preamble.tex",
      package = "fnaufelRmd"
    )
  ),
  md_extensions = '+fenced_divs+bracketed_spans',
  template = system.file(
    'rmarkdown/resources/tex/bd-format.latex',
    package = 'fnaufelRmd'
  ),
  ...
) {

  # call the base function
  bookdown::pdf_book(
    toc = toc,
    number_sections = number_sections,
    fig_caption = fig_caption,
    pandoc_args = pandoc_args,
    base_format = base_format,
    toc_unnumbered = toc_unnumbered,
    toc_appendix = toc_appendix,
    toc_bib = toc_bib,
    quote_footer = quote_footer,
    highlight_bw = highlight_bw,
    df_print = df_print,
    keep_tex = keep_tex,
    latex_engine = latex_engine,
    citation_package = citation_package,
    includes = includes,
    md_extensions = md_extensions,
    template = template,
    ...
  )

}
