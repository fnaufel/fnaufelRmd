#' @title new_book
#' @description Creates new files based on the fnaufelRmd::book template
#' @param name Main file name, Default: 'index.Rmd'
#' @return The file name of the new document (invisibly)
#' @author fnaufel
#' @export
#' @importFrom rmarkdown draft
new_book <- function(name = 'index.Rmd') {

  rmarkdown::draft(name, 'book', 'fnaufelRmd', edit = FALSE)

}
