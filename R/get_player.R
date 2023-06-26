#' Get a single player
#'
#' Gets the player details for one player.
#'
#' @param tag Required. The player to return.
#' @param key Required. API key. See <https://developer.clashofclans.com/#/documentation>
#' Default: `coc_get_key()`
#'
#' @return a `tibble` of player info
#'
#' @concept player
#'
#' @export
#' @md
#' @examplesIf clash::has_clash_key()
#' coc_get_player('92GCQQYP')
coc_get_player <- function(tag = '92GCQQYP', key = get_clash_key()) {

  # Check inputs ----
  check_valid_tag(tag)
  check_valid_key(key)

  # Call to API ----
  resp <- req_base() |>
    req_player(tag) |>
    req_header(key) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  out <- resp |>
    widen()

  to_unnest <- lapply(out, function(x) if (is.data.frame(x[[1]])) return(NULL) else names(x[[1]])) |>
    lengths() |>
    purrr::discard(function(x) x == 0) |>
    names()

  for (i in seq_along(to_unnest)) {
    out <- out |>
      tidyr::unnest_wider(tidyr::any_of(to_unnest[i]), names_sep = '_')
  }

  to_bind_row <- purrr::map_int(out, function(x) length(names(x[[1]][[1]]))) |>
    purrr::discard(function(x) x == 0) |>
    names()

  for (i in seq_along(to_bind_row)) {
    out[[to_bind_row[i]]] <- list(
      dplyr::bind_rows(out[[to_bind_row[i]]]) |>
        clean_names()
    )
  }


  `attr<-`(out, 'paging', resp$paging)

  out |>
    clean_names()
}
