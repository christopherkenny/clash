#' Get CLan War Log
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
#' coc_get_war_log(clan = '8UC2J90Y')
coc_get_war_log <- function(clan,
                            limit = NULL, after = NULL, before = NULL,
                            key = coc_get_key()) {

  # Check inputs ---
  check_valid_clan(clan)
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    req_clan(clan) |>
    httr2::req_url_path_append('warlog') |>
    req_header(key) |>
    req_where(limit, after, before) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  # Clean output ---
  out <- dplyr::bind_rows(lapply(resp$items, widen)) |>
    clean_names()

  out$clan <- lapply(out$clan, dplyr::bind_rows)
  out$opponent <- lapply(out$opponent, dplyr::bind_rows)

  `attr<-`(out, 'paging', resp$paging)

  out
}
