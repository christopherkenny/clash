#' Get a single player
#'
#' Gets the player details for one player.
#'
#' @param tag Required. The player to return.
#' @param key Required. API key. See <https://developer.clashofclans.com/#/documentation>
#' Default: `get_clash_key()`
#'
#' @return a `tibble` of player info
#'
#' @concept player
#'
#' @export
#'
#' @examplesIf clash::has_clash_key()
#' coc_get_player('92GCQQYP')
coc_get_player <- function(tag, key = get_clash_key()) {

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
    widen() |>
    unnest_single() |>
    unnest_tibble()

  `attr<-`(out, 'paging', resp$paging)

  out |>
    clean_names()
}
