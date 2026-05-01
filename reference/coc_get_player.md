# Get a single player

Gets the player details for one player.

## Usage

``` r
coc_get_player(tag, key = get_clash_key())
```

## Arguments

- tag:

  Required. The player to return.

- key:

  Required. API key. See
  <https://developer.clashofclans.com/#/documentation> Default:
  [`get_clash_key()`](http://christophertkenny.com/clash/reference/key.md)

## Value

a `tibble` of player info

## Examples

``` r
if (FALSE) { # clash::has_clash_key()
coc_get_player('92GCQQYP')
}
```
