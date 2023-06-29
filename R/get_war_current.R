#' Get current Clan War
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
#' coc_get_war_current(clan = '8UC2J90Y')
coc_get_war_current <- function(clan,
                                      limit = NULL, after = NULL, before = NULL,
                                      key = get_clash_key()) {

  # Check inputs ---
  check_valid_clan(clan)
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    req_clan(clan) |>
    httr2::req_url_path_append('currentwar') |>
    req_header(key) |>
    req_where(limit, after, before) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  # Clean output ---
  out <- resp |>
    widen() |>
    unnest_single() |>
    unnest_tibble() |>
    unnest_single() |>
    clean_names()

  `attr<-`(out, 'paging', resp$paging)

  out
}
