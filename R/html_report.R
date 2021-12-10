#' Custom HTML template
#'
#' Loads additional style and configs
#'
#' @title html_report
#'
#' @param toc see [rmarkdown::html_document]
#' @param toc see [rmarkdown::html_document]
#' @param toc see [rmarkdown::html_document]
#' @param number see [rmarkdown::html_document]
#' @param anchor see [rmarkdown::html_document]
#' @param section see [rmarkdown::html_document]
#' @param fig see [rmarkdown::html_document]
#' @param fig see [rmarkdown::html_document]
#' @param fig see [rmarkdown::html_document]
#' @param fig see [rmarkdown::html_document]
#' @param dev see [rmarkdown::html_document]
#' @param df see [rmarkdown::html_document]
#' @param code see [rmarkdown::html_document]
#' @param code see [rmarkdown::html_document]
#' @param self see [rmarkdown::html_document]
#' @param theme see [rmarkdown::html_document]
#' @param highlight see [rmarkdown::html_document]
#' @param mathjax see [rmarkdown::html_document]
#' @param template see [rmarkdown::html_document]
#' @param extra see [rmarkdown::html_document]
#' @param css see [rmarkdown::html_document]
#' @param includes see [rmarkdown::html_document]
#' @param keep see [rmarkdown::html_document]
#' @param lib see [rmarkdown::html_document]
#' @param md see [rmarkdown::html_document]
#' @param pandoc see [rmarkdown::html_document]
#' @param ... see [rmarkdown::html_document]
#'
#' @return see [rmarkdown::html_document]
#'
#' @author fnaufel
#' @export
#' @importFrom bslib bs_theme font_google
#' @importFrom rmarkdown includes html_document
#' @importFrom purrr walk
#'
html_report <- function(
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
  code_folding = "show",
  code_download = TRUE,
  self_contained = TRUE,
  theme = "default",
  highlight = "default",
  mathjax = "default",
  template = "default",
  extra_dependencies = NULL,
  css = 'html_files/styles.css',
  includes = rmarkdown::includes(
    in_header = 'html_files/preamble.html'
  ),
  keep_md = FALSE,
  lib_dir = "libs",
  md_extensions = NULL,
  pandoc_args = NULL,
  ...
) {

  # Destination dir for supporting files
  to <- normalizePath(dirname(css))

  # Check if supporting files are outdated. If so, copy from package dir
  supporting <- system.file(
    c(
      'rmarkdown/resources/html_files/styles.css',
      'rmarkdown/resources/html_files/alterar_detalhes.js',
      'rmarkdown/resources/html_files/preamble.html',
      'rmarkdown/resources/images'
    ),
    package = 'fnaufelRmd'
  )
  purrr::walk(supporting, ~copy_if_stale(., to))

  # call the base function
  rmarkdown::html_document(
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
    ...
  )

}
