# Search Clans

Search Clans

## Usage

``` r
coc_get_clan_search(
  name = NULL,
  location_id = NULL,
  war_frequency = NULL,
  min_members = NULL,
  max_members = NULL,
  min_clan_points = NULL,
  min_clan_level = NULL,
  limit = NULL,
  after = NULL,
  before = NULL,
  label_ids = NULL,
  key = get_clash_key()
)
```

## Arguments

- name:

  Search clans by name

- location_id:

  Filter by clan location identifier

- war_frequency:

  Filter by war frequency

- min_members:

  Filter by minimum number of clan members

- max_members:

  Filter by maximum number of clan members

- min_clan_points:

  minimum amount of clan points

- min_clan_level:

  minimum clan level

- limit:

  number of items returned in the response.

- after:

  return only items that occur after this marker.

- before:

  return only items that occur before this marker.

- label_ids:

  comma separated vector to filter results by

- key:

  Required. API key. See
  <https://developer.clashofclans.com/#/documentation>. Default:
  [`get_clash_key()`](http://christophertkenny.com/clash/reference/key.md)

## Value

a `tibble` with each row as a player

## Examples

``` r
if (FALSE) { # clash::has_clash_key()
coc_get_clan_search('Dusty Death', limit = 5)
}
```
