#' Custom HTML template for reports
#'
#' Loads additional style and configs
#'
#' @title html_report
#'
#' @param copy_supporting_files If TRUE, copy supporting files (css, js, html) to document dir before rendering
#' @param toc see [rmarkdown::html_document]
#' @param toc_depth see [rmarkdown::html_document]
#' @param toc_float see [rmarkdown::html_document]
#' @param number_sections see [rmarkdown::html_document]
#' @param anchor_sections see [rmarkdown::html_document]
#' @param section_divs see [rmarkdown::html_document]
#' @param fig_width see [rmarkdown::html_document]
#' @param fig_height see [rmarkdown::html_document]
#' @param fig_retina see [rmarkdown::html_document]
#' @param fig_caption see [rmarkdown::html_document]
#' @param dev see [rmarkdown::html_document]
#' @param df_print see [rmarkdown::html_document]
#' @param code_folding see [rmarkdown::html_document]
#' @param code_download see [rmarkdown::html_document]
#' @param self_contained see [rmarkdown::html_document]
#' @param theme see [rmarkdown::html_document]
#' @param highlight see [rmarkdown::html_document]
#' @param mathjax see [rmarkdown::html_document]
#' @param template see [rmarkdown::html_document]
#' @param extra_dependencies see [rmarkdown::html_document]
#' @param css see [rmarkdown::html_document]
#' @param includes see [rmarkdown::html_document]
#' @param keep_md see [rmarkdown::html_document]
#' @param lib_dir see [rmarkdown::html_document]
#' @param md_extensions see [rmarkdown::html_document]
#' @param pandoc_args see [rmarkdown::html_document]
#' @param ... see [rmarkdown::html_document]
#'
#' @return see [rmarkdown::html_document]
#'
#' @author fnaufel
#' @export
#' @importFrom bslib bs_theme font_google
#' @importFrom rmarkdown includes html_document
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
  code_folding = "show",
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
  ...
) {

  if (copy_supporting_files) {
    # Destination dir for supporting files
    target_dir <- normalizePath('html_files')

    supporting <- system.file(
      c(
        'rmarkdown/resources/html_files/styles_all.css',
        'rmarkdown/resources/html_files/styles_report.css',
        'rmarkdown/resources/html_files/alterar_detalhes.js',
        'rmarkdown/resources/html_files/preamble.html',
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
