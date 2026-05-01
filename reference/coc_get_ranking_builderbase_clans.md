# Get Builder Base Clan Rankings

Get Builder Base Clan Rankings

## Usage

``` r
coc_get_ranking_builderbase_clans(
  location,
  limit = NULL,
  after = NULL,
  before = NULL,
  key = coc_get_key()
)
```

## Arguments

- location:

  location id, such as 32000249

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

tibble of card info

## Examples

``` r
if (FALSE) { # clash::coc_has_key()
coc_get_ranking_builderbase_clans(location = 32000249)
}
```
