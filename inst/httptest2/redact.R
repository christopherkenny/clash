function(resp) {
  resp |>
    httptest2::gsub_response('https://api.clashofclans.com/v1/', '', fixed = TRUE) |>
    httptest2::gsub_response(pattern = clash::get_clash_key(), '')
}
