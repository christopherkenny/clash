#' Get current clan members
#'
#' @param clan Required. Clan tag.
#' @param limit `r template_var_limit()`
#' @param after `r template_var_after()`
#' @param before `r template_var_before()`
#' @param key `r template_var_key()`
#'
#' @return `tibble` with list columns for clan, clans, and history.
#'
#' @concept clan
#'
#' @export
#'
#' @examplesIf clash::has_clash_key()
#' coc_get_clan_members('8UC2J90Y')
coc_get_clan_members <- function(clan,
                                limit = NULL, after = NULL, before = NULL,
                                key = coc_get_key()) {

  # Check inputs ---
  check_valid_clan(clan)
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    req_clan(clan) |>
    httr2::req_url_path_append('members') |>
    req_header(key) |>
    req_where(limit, after, before) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  # Clean output ---
  out <- dplyr::bind_rows(lapply(resp$items, widen)) |>
    clean_names()

  `attr<-`(out, 'paging', resp$paging)

  out
}
