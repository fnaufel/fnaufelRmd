#' Custom HTML template
#'
#' Loads additional style and configs
#'
#' @title bs4_book
#'
#' @param theme see [bookdown::bs4_book]
#' @param template see [bookdown::bs4_book]
#' @param includes see [bookdown::bs4_book]
#' @param css see [bookdown::bs4_book]
#' @param repo see [bookdown::bs4_book]
#' @param site see [bookdown::bs4_book]
#' @param lib_dir see [bookdown::bs4_book]
#' @param pandoc_args see [bookdown::bs4_book]
#' @param extra_dependencies see [bookdown::bs4_book]
#' @param split_bib see [bookdown::bs4_book]
#' @param section_divs see [bookdown::bs4_book]
#' @param fig_width see [bookdown::bs4_book]
#' @param fig_height see [bookdown::bs4_book]
#' @param fig_retina see [bookdown::bs4_book]
#' @param fig_caption see [bookdown::bs4_book]
#' @param dev see [bookdown::bs4_book]
#' @param df_print see [bookdown::bs4_book]
#' @param mathjax see [bookdown::bs4_book]
#' @param keep_md see [bookdown::bs4_book]
#' @param md_extensions see [bookdown::bs4_book]
#' @param ... see [bookdown::bs4_book]
#'
#' @return see [bookdown::bs4_book]
#'
#' @author fnaufel
#' @export
#'
#' @importFrom bookdown bs4_book_theme bookdown_site bs4_book
#' @importFrom bslib font_google
#' @importFrom rmarkdown includes
bs4_book <- function(
  theme = bookdown::bs4_book_theme(
    primary = "#086a6a",
    base_font = bslib::font_google("Lexend"),
    heading_font = bslib::font_google("Roboto"),
    code_font = bslib::font_google("JetBrains Mono"),
  ),
  template = system.file(
    "rmarkdown/resources/html_files/bs4_book_ptbr.html",
    package = "fnaufelRmd"
  ),
  includes = rmarkdown::includes(
    in_header = 'html_files/preamble.html'
  ),
  css = 'html_files/styles.css',
  repo = NULL,
  site = bookdown::bookdown_site,
  lib_dir = "libs",
  pandoc_args = NULL,
  extra_dependencies = NULL,
  split_bib = FALSE,
  section_divs = TRUE,
  fig_width = 7,
  fig_height = 5,
  fig_retina = 2,
  fig_caption = TRUE,
  dev = 'png',
  df_print = 'paged',
  mathjax = 'default',
  keep_md = FALSE,
  md_extensions = NULL,
  ...
) {

  # call the base function
  bookdown::bs4_book(
    theme = theme,
    repo = repo,
    site = site,
    lib_dir = lib_dir,
    pandoc_args = pandoc_args,
    extra_dependencies = extra_dependencies,
    template = template,
    split_bib = split_bib,
    section_divs = section_divs,
    fig_width = fig_width,
    fig_height = fig_height,
    fig_retina = fig_retina,
    fig_caption = fig_caption,
    dev = dev,
    df_print = df_print,
    mathjax = mathjax,
    css = css,
    includes = includes,
    keep_md = keep_md,
    md_extensions = md_extensions,
    before_chapter_script =
      system.file(
        "rmarkdown/resources/R/_common_book.R",
        package = "fnaufelRmd"
      ),
    ...
  )

}
