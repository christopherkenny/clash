#' Get a clan
#'
#' Gets full clan details
#'
#' @param clan Required. Clan tag.
#' @param key Required. API key. See <https://developer.clashofclans.com/#/documentation>
#' Default: `get_clash_key()`
#'
#' @return a `tibble` with each row as a player
#'
#' @concept clan
#'
#' @export
#'
#' @examplesIf clash::has_clash_key()
#' coc_get_clan('8UC2J90Y')
coc_get_clan <- function(clan, key = get_clash_key()) {

  # Check inputs ---
  check_valid_clan(clan)
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    req_clan(clan) |>
    req_header(key) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  out <- resp |>
    widen() |>
    unnest_single()

  out$memberList <- list(lapply(
    out$memberList, function(el) {
      lapply(el, function(x) {
        x |> unnest_single() |> unnest_tibble() |> widen()
      }) |> dplyr::bind_rows()
    })  |> dplyr::bind_rows())

  out <- out |>
    unnest_tibble()

  out <- out |>
    dplyr::rename_with(.fn = function(x) stringr::str_replace(x, 'member_list', 'player'))

  `attr<-`(out, 'paging', resp$paging)

  out |> clean_names()
}
