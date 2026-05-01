# Get information for one Builder Base league

Get information for one Builder Base league

## Usage

``` r
coc_get_builderbase_league(
  league,
  limit = NULL,
  after = NULL,
  before = NULL,
  key = coc_get_key()
)
```

## Arguments

- league:

  league id, such as 44000041

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
coc_get_builderbase_league(league = '44000041', limit = 10)
}
```
