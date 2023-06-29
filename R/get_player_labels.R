#' Get player labels
#'
#' @param key Required. API key. See <https://developer.clashroyale.com/#/documentation>
#' Default: `cr_get_key()`
#' @param limit `r template_var_limit()`
#' @param after `r template_var_after()`
#' @param before `r template_var_before()`
#'
#' @return tibble of card info
#'
#' @concept labels
#'
#' @export
#' @md
#' @examplesIf clash::has_clash_key()
#' coc_get_player_labels()
coc_get_player_labels <- function(limit = NULL, after = NULL, before = NULL, key = get_clash_key()) {

  # Check inputs ---------------------------------------------------------------
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    httr2::req_url_path_append('labels', 'players') |>
    req_header(key) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  out <- resp$items |>
    dplyr::bind_rows() |>
    tidyr::unnest_wider('iconUrls', names_sep = '_') |>
    dplyr::rename_with(.fn = function(x) stringr::str_sub(x, end = -3), .cols = dplyr::ends_with('_1')) |>
    clean_names()

  out
}
