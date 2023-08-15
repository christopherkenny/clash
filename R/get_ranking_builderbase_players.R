#' Get Builder Base Player Rankings
#'
#' @param location location id, such as 32000249
#' @param key `r template_var_key()`
#' @param limit `r template_var_limit()`
#' @param after `r template_var_after()`
#' @param before `r template_var_before()`
#'
#' @return tibble of card info
#'
#' @concept locations
#'
#' @export
#' @md
#' @examplesIf clash::coc_has_key()
#' coc_get_ranking_builderbase_players(location = 32000249)
coc_get_ranking_builderbase_players <- function(location,
                                    limit = NULL, after = NULL, before = NULL,
                                    key = coc_get_key()) {

  # Check inputs ---------------------------------------------------------------
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    httr2::req_url_path_append('locations', location, 'rankings', 'players-builder-base') |>
    req_header(key) |>
    req_where(limit, after, before) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  out <- dplyr::bind_rows(lapply(resp$items, widen)) |>
    clean_names()

  out$clan <- lapply(out$clan, function(x) x |> widen() |> dplyr::bind_rows())

  `attr<-`(out, 'paging', resp$paging)

  out
}
