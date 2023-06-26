with_mock_dir("t/player", {
  test_that("coc_get_player works", {
    x <- coc_get_player('92GCQQYP')
    expect_s3_class(x, 'tbl_df')
  })
})
