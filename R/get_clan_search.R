#' Search Clans
#'
#' @param name Search clans by name
#' @param location_id Filter by clan location identifier
#' @param war_frequency Filter by war frequency
#' @param min_members Filter by minimum number of clan members
#' @param max_members Filter by maximum number of clan members
#' @param min_clan_points minimum amount of clan points
#' @param min_clan_level minimum clan level
#' @param limit `r template_var_limit()`
#' @param after `r template_var_after()`
#' @param before `r template_var_before()`
#' @param label_ids comma separated vector to filter results by
#' @param key `r template_var_key()`
#'
#' @return a `tibble` with each row as a player
#'
#' @concept clan
#'
#' @export
#'
#' @examplesIf clash::has_clash_key()
#' coc_get_clan_search('Dusty Death', limit = 5)
coc_get_clan_search <- function(name = NULL, location_id = NULL, war_frequency = NULL,
                               min_members = NULL, max_members = NULL,
                               min_clan_points = NULL, min_clan_level = NULL,
                               limit = NULL, after = NULL, before = NULL,
                               label_ids = NULL,
                               key = get_clash_key()) {

  # Check inputs ---
  check_valid_key(key)

  # Call to API ---
  resp <- req_base() |>
    httr2::req_url_path_append('clans') |>
    req_header(key) |>
    httr2::req_url_query(
      'name' = name,
      'warFrequency' = war_frequency,
      'locationId' = location_id,
      'minMembers' = min_members,
      'maxMembers' = max_members,
      'minClanPoints' = min_clan_points,
      'minClanLevel' = min_clan_level,
      'limit' = limit,
      'after' = after,
      'before' = before,
      'labelIds' = label_ids
    ) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  out <- lapply(resp$items, widen) |>
    dplyr::bind_rows()

  out$labels <- lapply(out$labels, function(el) {
    lapply(el, unlist) |> dplyr::bind_rows()
  })

  `attr<-`(out, 'paging', resp$paging)

  out |>
    clean_names()
}
