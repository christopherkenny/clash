#' Get Capital Raid Seasons
#'
#' @param clan Required. Clan tag.
#' @param key `r template_var_key()`
#' @param limit `r template_var_limit()`
#' @param after `r template_var_after()`
#' @param before `r template_var_before()`
#'
#' @return `tibble` with list columns for clan, clans, and history.
#'
#' @concept clan
#'
#' @export
#'
#' @examplesIf clash::has_clash_key()
#' coc_get_capital_raid_seasons(clan = '8UC2J90Y')
coc_get_capital_raid_seasons <- function(clan,
                                         limit = NULL, after = NULL, before = NULL,
                                         key = get_clash_key()) {

  # Check inputs ---
  check_valid_clan(clan)
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    req_clan(clan) |>
    httr2::req_url_path_append('capitalraidseasons') |>
    req_header(key) |>
    req_where(limit, after, before) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  # Clean output ---
  out <- dplyr::bind_rows(lapply(resp$items, widen)) |>
    clean_names()

  out$defense_log <- lapply(out$defense_log, function(el) {
    lapply(el, function(k) {
      k$attacker <- dplyr::bind_rows(k$attacker)
      k$districts <- dplyr::bind_rows(k$districts)
      k
    }) |> unnest_single() |> unnest_tibble() |> lapply(widen) |> dplyr::bind_rows()
  })

  `attr<-`(out, 'paging', resp$paging)

  out
}
