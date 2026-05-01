# Add Entry to Renviron

Adds Clash of Clans API key to .Renviron.

## Usage

``` r
set_clash_key(key, overwrite = FALSE, install = FALSE)

coc_set_key(key, overwrite = FALSE, install = FALSE)
```

## Arguments

- key:

  Character. API key to add to add.

- overwrite:

  Defaults to FALSE. Boolean. Should existing `COC_KEY` in Renviron be
  overwritten?

- install:

  Defaults to FALSE. Boolean. Should this be added '~/.Renviron' file?

## Value

key, invisibly

## Examples

``` r
if (FALSE) { # \dontrun{
set_clash_key('1234')
} # }
```
