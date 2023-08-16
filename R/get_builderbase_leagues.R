#' Get Builder Base Leagues
#'
#' @param key `r template_var_key()`
#' @param limit `r template_var_limit()`
#' @param after `r template_var_after()`
#' @param before `r template_var_before()`
#'
#' @return `tibble` with list columns for clan, clans, and history.
#'
#' @concept league
#'
#' @export
#'
#' @examplesIf clash::has_clash_key()
#' coc_get_builderbase_leagues(limit = 10)
coc_get_builderbase_leagues <- function(limit = NULL, after = NULL, before = NULL,
                                        key = coc_get_key()) {

  # Check inputs ---
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    httr2::req_url_path_append('builderbaseleagues') |>
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
