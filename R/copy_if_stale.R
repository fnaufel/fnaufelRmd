#' @title copy_if_stale
#'
#' @description Copy files from `from` to `to` if the former are
#' more recent than the latter. All directories in `from` are copied
#' unconditionally.
#'
#' @param from absolute path of single file or single dir to copy from
#' @param to absolute path of single **dir** to copy to
#'
#' @export
#'
#' @importFrom purrr walk
#'
copy_if_stale <- function(
  from,
  to
) {

  if (length(from) != 1 || length(to) != 1) {
    stop(
      paste0(
        'Arguments to `copy_if_stale` must be length 1.\n',
        'from = ', from,
        'to = ', to
      )
    )
  }

  if (!file.exists(from)) {
    stop(
      paste0(
        '`from` does not exist:\n',
        from
      )
    )
  }

  from_info <- file.info(from, extra_cols = FALSE)
  to_info <- file.info(to, extra_cols = FALSE)

  if (!from_info$isdir) {
    # from is a single file
    copy_if_stale_single(from, to)
  } else {
    # from is a dir
    # get all files under it
    files <- file.path(from, list.files(from))

    if (!to_info$isdir) {
    # to is a file, not a dir
      stop(
        paste0(
          '`to` is a file; should be a dir:\n',
          to
        )
      )
    } else {
      if (is.na(to_info$isdir)) {
        # to does not exist
        dir.create(to)
      }
    }

    purrr::walk(
      files,
      ~copy_if_stale_single(., file.path(to, basename(.)))
    )

  }

}


#' copy_if_stale_single
#'
#' @param from absolute path of single **file** or **dir** to copy from
#' @param to absolute path of single **file** or **dir** to copy to
#'
copy_if_stale_single <- function(from, to) {

  if (dir.exists(from)) {
    # If source is a dir, copy anyway
    file.copy(
      from,
      dirname(to),
      overwrite = TRUE,
      recursive = TRUE,
      copy.date = TRUE
    )
  } else {
    # Source is a file: compare times
    if (!file.exists(to) || file.mtime(from) > file.mtime(to)) {
      file.copy(
        from,
        to,
        overwrite = TRUE,
        copy.date = TRUE
      )
    }
  }

}
