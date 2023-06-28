#' Check for valid tag
#'
#' Checks that provide player or clan tag could be a valid tag.
#' Does not verify that a player or clan has that tag.
#'
#' @noRd
check_valid_tag <- function(tag) {
  # if (!(all(unlist(strsplit(tag, '')) %in% c('0', '2', '8', '9', 'C', 'G', 'J', 'L', 'P', 'Q', 'R', 'U', 'V', 'Y')))) {
  #   cli::cli_abort('This tag includes invalid characters.')
  # }
  if (!is.character(tag)) {
    cli::cli_abort('{.arg tag} must be a character.')
  }

  if (length(tag) !=  1) {
    cli::cli_abort('{.arg tag} must be length 1.')
  }

  invisible(tag)
}

check_valid_clan <- function(clan) {
  if (stringr::str_length(clan) != 8) {
    cli::cli_abort('{.arg clan} must be 8 characters long')
  }
  if (substr(clan, 1, 1) == '#') {
    cli::cli_abort('{.arg clan} does not include "#"')
  }
  invisible(clan)
}

check_valid_key <- function(key) {
  if (nchar(key) == 0) {
    cli::cli_inform('Please set API key with {.fn cr_set_key}.')
  }
  invisible(key)
}

req_base <- function() {
  httr2::request(base_url = api_url())
}

req_clan <- function(req, x) {
  httr2::req_url_path_append(req, 'clans', paste0('%23', stringr::str_remove(x, '#')))
}

req_player <- function(req, x) {
  httr2::req_url_path_append(req, 'players', paste0('%23', stringr::str_remove(x, '#')))
}

req_header <- function(req, key) {
  httr2::req_auth_bearer_token(req, key)
}

clean_names <- function(x) {
  out <- names(x) |>
    stringr::str_replace_all('\\.', '_') |>
    stringr::str_replace_all('([a-z])([A-Z])', '\\1_\\2') |>
    stringr::str_to_lower()
  stats::setNames(object = x, nm = out)
}

widen <- function(x) {
  x |>
    tibble::enframe() |>
    tidyr::pivot_wider() |>
    tidyr::unnest_wider(col = where(~purrr::pluck_depth(.x) < 4), simplify = TRUE, names_sep = '_') |>
    dplyr::rename_with(.fn = function(x) stringr::str_sub(x, end = -3), .cols = dplyr::ends_with('_1'))
}

unnest_single <- function(out) {
  to_unnest <- lapply(out, function(x) if (is.data.frame(x[[1]])) return(NULL) else names(x[[1]])) |>
    lengths() |>
    purrr::discard(function(x) x == 0) |>
    names()

  for (i in seq_along(to_unnest)) {
    out <- out |>
      tidyr::unnest_wider(tidyr::any_of(to_unnest[i]), names_sep = '_')
  }

  out
}

unnest_tibble <- function(out) {
  to_bind_row <- purrr::map_int(out, function(x) length(names(x[[1]][[1]]))) |>
    purrr::discard(function(x) x == 0) |>
    names()

  for (i in seq_along(to_bind_row)) {
    out[[to_bind_row[i]]] <- list(
      dplyr::bind_rows(out[[to_bind_row[i]]]) |>
        clean_names()
    )
  }
  out
}
