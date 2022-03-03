#' Custom HTML template for reports
#'
#' Loads additional style and configs
#'
#' @title html_report
#'
#' @param copy_supporting_files If TRUE, copy supporting files (css, js, html) to document dir before rendering
#' @param toc see [bookdown::html_document2]
#' @param toc_depth see [bookdown::html_document2]
#' @param toc_float see [bookdown::html_document2]
#' @param number_sections see [bookdown::html_document2]
#' @param anchor_sections see [bookdown::html_document2]
#' @param section_divs see [bookdown::html_document2]
#' @param fig_width see [bookdown::html_document2]
#' @param fig_height see [bookdown::html_document2]
#' @param fig_retina see [bookdown::html_document2]
#' @param fig_caption see [bookdown::html_document2]
#' @param dev see [bookdown::html_document2]
#' @param df_print see [bookdown::html_document2]
#' @param code_folding see [bookdown::html_document2]
#' @param code_download see [bookdown::html_document2]
#' @param self_contained see [bookdown::html_document2]
#' @param theme see [bookdown::html_document2]
#' @param highlight see [bookdown::html_document2]
#' @param mathjax see [bookdown::html_document2]
#' @param template see [bookdown::html_document2]
#' @param extra_dependencies see [bookdown::html_document2]
#' @param css see [bookdown::html_document2]
#' @param includes see [bookdown::html_document2]
#' @param keep_md see [bookdown::html_document2]
#' @param lib_dir see [bookdown::html_document2]
#' @param md_extensions see [bookdown::html_document2]
#' @param pandoc_args see [bookdown::html_document2]
#' @param ... see [bookdown::html_document2]
#'
#' @return see [bookdown::html_document2]
#'
#' @author fnaufel
#' @export
#' @importFrom bslib bs_theme font_google
#' @importFrom rmarkdown includes
#' @importFrom bookdown html_document2
#'
html_report <- function(
  copy_supporting_files = TRUE,
  toc = TRUE,
  toc_depth = 3,
  toc_float = FALSE,
  number_sections = TRUE,
  anchor_sections = TRUE,
  section_divs = TRUE,
  fig_width = 7,
  fig_height = 5,
  fig_retina = 2,
  fig_caption = TRUE,
  dev = "png",
  df_print = "paged",
  code_folding = "none",
  code_download = TRUE,
  self_contained = TRUE,
  theme = "default",
  highlight = "default",
  mathjax = "default",
  template = "default",
  extra_dependencies = NULL,
  css = 'default',
  includes = rmarkdown::includes(
    in_header = 'html_files/preamble.html'
  ),
  keep_md = FALSE,
  lib_dir = "libs",
  md_extensions = NULL,
  pandoc_args = NULL,
  highlight_downlit = TRUE,
  ...
) {

  if (copy_supporting_files) {
    # Destination dir for supporting files (HTML)
    target_dir <- normalizePath('html_files')
    if (!dir.exists(target_dir))
      dir.create(target_dir)

    supporting <- system.file(
      c(
        'rmarkdown/resources/html_files/styles_all.css',
        'rmarkdown/resources/html_files/styles_report.css',
        'rmarkdown/resources/html_files/alterar_detalhes.js',
        'rmarkdown/resources/html_files/preamble.html',
        'rmarkdown/resources/html_files/abnt-note.csl',
        'rmarkdown/resources/html_files/chicago-fullnote-bibliography.csl',
        'rmarkdown/resources/images'
      ),
      package = 'fnaufelRmd'
    )

    file.copy(
      from = supporting,
      to = target_dir,
      overwrite = TRUE,
      recursive = TRUE,
      copy.date = TRUE
    )

  }

  # css styles
  if ('default' %in% css) {
    css <- c(
      'html_files/styles_all.css',
      'html_files/styles_report.css',
      css[css != 'default']
    )
  }

  # call the base function
  bookdown::html_document2(
    toc = toc,
    toc_depth = toc_depth,
    toc_float = toc_float,
    number_sections = number_sections,
    anchor_sections = anchor_sections,
    section_divs = section_divs,
    fig_width = fig_width,
    fig_height = fig_height,
    fig_retina = fig_retina,
    fig_caption = fig_caption,
    dev = dev,
    df_print = df_print,
    code_folding = code_folding,
    code_download = code_download,
    self_contained = self_contained,
    theme = theme,
    highlight = highlight,
    mathjax = mathjax,
    template = template,
    extra_dependencies = extra_dependencies,
    css = css,
    includes = includes,
    keep_md = keep_md,
    lib_dir = lib_dir,
    md_extensions = md_extensions,
    pandoc_args = pandoc_args,
    highlight_downlit,
    ...
  )

}
