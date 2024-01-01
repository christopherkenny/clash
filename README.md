
<!-- README.md is generated from README.Rmd. Please edit that file -->

# clash <a href="http://christophertkenny.com/clash/"><img src="man/figures/logo.png" align="right" height="138" alt="clash website" /></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/christopherkenny/clash/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/christopherkenny/clash/actions/workflows/R-CMD-check.yaml)
[![clash status
badge](https://christopherkenny.r-universe.dev/badges/clash)](https://christopherkenny.r-universe.dev/clash)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
<!-- badges: end -->

`clash` provides an R interface to the [Clash of Clans
API](https://developer.clashofclans.com/#/).

## Installation

You can install the development version of `clash` from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("christopherkenny/clash")
```

## Example

Current endpoints are included for cards, rankings, tournaments,
players, and clans.

To get a player’s data, we can use:

``` r
library(clash)

coc_get_player('92GCQQYP')
#> # A tibble: 1 × 32
#>   tag       name       town_hall_level town_hall_weapon_level exp_level trophies
#>   <chr>     <chr>                <int>                  <int>     <int>    <int>
#> 1 #92GCQQYP christoph…              14                      5       210     2534
#> # ℹ 26 more variables: best_trophies <int>, war_stars <int>, attack_wins <int>,
#> #   defense_wins <int>, builder_hall_level <int>, builder_base_trophies <int>,
#> #   best_builder_base_trophies <int>, role <chr>, war_preference <chr>,
#> #   donations <int>, donations_received <int>,
#> #   clan_capital_contributions <int>, clan_tag <chr>, clan_name <chr>,
#> #   clan_clan_level <int>, clan_badge_urls <list>,
#> #   builder_base_league_id <int>, builder_base_league_name <chr>, …
```

To get a clan, we can use:

``` r
clan <- coc_get_clan('8UC2J9OY')
clan
#> # A tibble: 1 × 34
#>   tag      name  type  description location_id location_name location_is_country
#>   <chr>    <chr> <chr> <chr>             <int> <chr>         <lgl>              
#> 1 #8UC2J9… Dust… invi… Chan: (v) …    32000249 United States TRUE               
#> # ℹ 27 more variables: location_country_code <chr>, is_family_friendly <lgl>,
#> #   badge_urls_small <chr>, badge_urls_large <chr>, badge_urls_medium <chr>,
#> #   clan_level <int>, clan_points <int>, clan_builder_base_points <int>,
#> #   clan_capital_points <int>, capital_league_id <int>,
#> #   capital_league_name <chr>, required_trophies <int>, war_frequency <chr>,
#> #   war_win_streak <int>, war_wins <int>, war_ties <int>, war_losses <int>,
#> #   is_war_log_public <lgl>, war_league_id <int>, war_league_name <chr>, …
```

This returns clan-level attributes, such as lists of members in the
clan:

``` r
clan$member_list
#> [[1]]
#> # A tibble: 22 × 15
#>    tag        name            role  townHallLevel expLevel league       trophies
#>    <chr>      <chr>           <chr>         <int>    <int> <list>          <int>
#>  1 #JY2J2QP2  Evan1125        lead…            14      209 <named list>     3134
#>  2 #92GCQQYP  christopher26   coLe…            14      210 <named list>     2534
#>  3 #LP0VGC92  bailey          coLe…            12      157 <named list>     2461
#>  4 #YQPCQ9RY  Regal           coLe…            12      156 <named list>     2276
#>  5 #LCJQ0Y2CR Cefola          coLe…            11      116 <named list>     2210
#>  6 #8L9L0YL8Y Fiore           coLe…            13      158 <named list>     2206
#>  7 #9RCGLLLY  Christopher0626 admin            11      142 <named list>     1996
#>  8 #UUUPL8G9  ziren           coLe…            10      120 <named list>     1700
#>  9 #9V8L98V   My Dad          memb…            10      107 <named list>     1656
#> 10 #LR00J0V0  J$              admin            11      126 <named list>     1604
#> # ℹ 12 more rows
#> # ℹ 8 more variables: builderBaseTrophies <int>, clanRank <int>,
#> #   previousClanRank <int>, donations <int>, donationsReceived <int>,
#> #   playerHouse <list>, builderBaseLeague_id <int>,
#> #   builderBaseLeague_name <chr>
```

## Disclaimer

**This content is not affiliated with, endorsed, sponsored, or
specifically approved by Supercell and Supercell is not responsible for
it. For more information see Supercell’s Fan Content Policy:
\<www.supercell.com/fan-content-policy\>.**
