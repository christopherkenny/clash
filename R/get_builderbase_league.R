#' Get information for one Builder Base league
#'
#' @param league league id, such as 44000041
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
#' coc_get_builderbase_league(league = '44000041', limit = 10)
coc_get_builderbase_league <- function(league,
                                       limit = NULL, after = NULL, before = NULL,
                                        key = coc_get_key()) {

  # Check inputs ---
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    httr2::req_url_path_append('builderbaseleagues', league) |>
    req_header(key) |>
    req_where(limit, after, before) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  # Clean output ---
  out <- dplyr::bind_rows(resp) |>
    clean_names()

  `attr<-`(out, 'paging', resp$paging)

  out

}
