#' @title merge_named_lists
#' @param l1 one list with named elements
#' @param l2 another list with named elements
#' @return merged list
#' @author Fernando Naufel
merge_named_lists <- function(l1, l2) {

  for (elt in union(names(l1), names(l2)))
    l1[[elt]] <- append(l1[[elt]], l2[[elt]])

  l1

}
