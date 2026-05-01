# Get clan labels

Get clan labels

## Usage

``` r
coc_get_clan_labels(
  limit = NULL,
  after = NULL,
  before = NULL,
  key = get_clash_key()
)
```

## Arguments

- limit:

  number of items returned in the response.

- after:

  return only items that occur after this marker.

- before:

  return only items that occur before this marker.

- key:

  Required. API key. See
  <https://developer.clashroyale.com/#/documentation> Default:
  `cr_get_key()`

## Value

tibble of card info

## Examples

``` r
if (FALSE) { # clash::has_clash_key()
coc_get_clan_labels()
}
```
