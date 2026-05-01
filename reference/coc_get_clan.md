# Get a clan

Gets full clan details

## Usage

``` r
coc_get_clan(clan, key = get_clash_key())
```

## Arguments

- clan:

  Required. Clan tag.

- key:

  Required. API key. See
  <https://developer.clashofclans.com/#/documentation> Default:
  [`get_clash_key()`](http://christophertkenny.com/clash/reference/key.md)

## Value

a `tibble` with each row as a player

## Examples

``` r
if (FALSE) { # clash::has_clash_key()
coc_get_clan(clan = '8UC2J90Y')
}
```
