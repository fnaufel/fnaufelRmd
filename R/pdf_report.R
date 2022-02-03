#' Custom PDF template for reports
#'
#' Loads additional style and configs
#'
#' @title pdf_report
#'
#' @param copy_supporting_files If TRUE, copy supporting files (.csl etc.) to document dir before rendering
#' @param toc see [rmarkdown::pdf_document]
#' @param toc_depth see [rmarkdown::pdf_document]
#' @param number_sections see [rmarkdown::pdf_document]
#' @param fig_width see [rmarkdown::pdf_document]
#' @param fig_height see [rmarkdown::pdf_document]
#' @param fig_crop see [rmarkdown::pdf_document]
#' @param fig_caption see [rmarkdown::pdf_document]
#' @param dev see [rmarkdown::pdf_document]
#' @param df_print see [rmarkdown::pdf_document]
#' @param highlight see [rmarkdown::pdf_document]
#' @param keep_tex see [rmarkdown::pdf_document]
#' @param keep_md see [rmarkdown::pdf_document]
#' @param latex_engine see [rmarkdown::pdf_document]
#' @param citation_package see [rmarkdown::pdf_document]
#' @param includes see [rmarkdown::pdf_document]
#' @param md_extensions see [rmarkdown::pdf_document]
#' @param template see [rmarkdown::pdf_document]
#' @param output_extensions see [rmarkdown::pdf_document]
#' @param pandoc_args see [rmarkdown::pdf_document]
#' @param extra_dependencies see [rmarkdown::pdf_document]
#' @param ... see [rmarkdown::pdf_document]
#'
#' @return see [rmarkdown::pdf_document]
#'
#' @author fnaufel
#'
#' @export
#' @importFrom rmarkdown includes pdf_document
#'
pdf_report <- function(
  copy_supporting_files = TRUE,
  toc = TRUE,
  toc_depth = 2,
  number_sections = TRUE,
  fig_width = 6.5,
  fig_height = 4.5,
  fig_crop = "auto",
  fig_caption = TRUE,
  dev = "pdf",
  df_print = "tibble",
  highlight = "default",
  keep_tex = TRUE,
  keep_md = FALSE,
  latex_engine = "xelatex",
  citation_package = "natbib",
  includes = rmarkdown::includes(
    in_header = system.file(
      "rmarkdown/resources/tex/report-preamble.tex",
      package = "fnaufelRmd"
    )
  ),
  md_extensions = '+fenced_divs+bracketed_spans',
  template = system.file(
    'rmarkdown/resources/tex/report-format.latex',
    package = 'fnaufelRmd'
  ),
  output_extensions = NULL,
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
  extra_dependencies = NULL,
  ...
) {

  if (copy_supporting_files) {
    # Destination dir for supporting files (PDF)
    target_dir <- normalizePath('pdf_files')
    if (!dir.exists(target_dir))
      dir.create(target_dir)

    supporting <- system.file(
      c(
        'rmarkdown/resources/pdf_files/abnt.csl',
        'rmarkdown/resources/pdf_files/chicago-author-date.csl'
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

  # call the base function
  rmarkdown::pdf_document(
    toc = toc,
    toc_depth = toc_depth,
    number_sections = number_sections,
    fig_width = fig_width,
    fig_height = fig_height,
    fig_crop = fig_crop,
    fig_caption = fig_caption,
    dev = dev,
    df_print = df_print,
    highlight = highlight,
    keep_tex = keep_tex,
    keep_md = keep_md,
    latex_engine = latex_engine,
    citation_package = citation_package,
    includes = includes,
    md_extensions = md_extensions,
    template = template,
    output_extensions = output_extensions,
    pandoc_args = pandoc_args,
    extra_dependencies = extra_dependencies,
    ...
  )

}
