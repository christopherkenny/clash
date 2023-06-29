#' Get Gold Pass Season Information
#'
#' @param key Required. API key. See <https://developer.clashroyale.com/#/documentation>
#' Default: `cr_get_key()`
#'
#' @return a `tibble` of gold pass info
#'
#' @concept goldpass
#'
#' @export
#' @md
#' @examplesIf clash::has_clash_key()
#' coc_get_goldpass()
coc_get_goldpass <- function(key = get_clash_key()) {

  # Check inputs ---------------------------------------------------------------
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    httr2::req_url_path_append('goldpass', 'seasons', 'current') |>
    req_header(key) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  out <- resp |>
    dplyr::bind_rows() |>
    clean_names()

  out
}
