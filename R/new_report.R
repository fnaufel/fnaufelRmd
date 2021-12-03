#' @title new_report
#' @description Creates new file based on the fnaufelRmd::report template
#' @param name Main file name, Default: 'index.Rmd'
#' @return The file name of the new document (invisibly)
#' @author fnaufel
#' @export
#' @importFrom rmarkdown draft
new_report <- function(name = 'index.Rmd') {

  rmarkdown::draft(name, 'report', 'fnaufelRmd', edit = FALSE)

}
