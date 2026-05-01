# Get information for one league

Get information for one league

## Usage

``` r
coc_get_league(
  league,
  season,
  limit = NULL,
  after = NULL,
  before = NULL,
  key = coc_get_key()
)
```

## Arguments

- league:

  league id, such as 29000022

- season:

  season id, such as '2022-09'

- limit:

  number of items returned in the response.

- after:

  return only items that occur after this marker.

- before:

  return only items that occur before this marker.

- key:

  Required. API key. See
  <https://developer.clashofclans.com/#/documentation>. Default:
  [`get_clash_key()`](http://christophertkenny.com/clash/reference/key.md)

## Value

`tibble` with list columns for clan, clans, and history.

## Examples

``` r
if (FALSE) { # clash::has_clash_key()
coc_get_league(league = '29000022', season = '2022-09', limit = 10)
}
```
