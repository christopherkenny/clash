
<!-- README.md is generated from README.Rmd. Please edit that file -->

# clash <a href="http://christophertkenny.com/clash/"><img src="man/figures/logo.png" align="right" height="138" alt="clash website" /></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/christopherkenny/clash/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/christopherkenny/clash/actions/workflows/R-CMD-check.yaml)
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
#> # A tibble: 1 × 38
#>   tag       name       town_hall_level town_hall_weapon_level exp_level trophies
#>   <chr>     <chr>                <int>                  <int>     <int>    <int>
#> 1 #92GCQQYP christoph…              14                      5       209     4135
#> # ℹ 32 more variables: best_trophies <int>, war_stars <int>, attack_wins <int>,
#> #   defense_wins <int>, builder_hall_level <int>, builder_base_trophies <int>,
#> #   versus_trophies <int>, best_builder_base_trophies <int>,
#> #   best_versus_trophies <int>, versus_battle_wins <int>, role <chr>,
#> #   war_preference <chr>, donations <int>, donations_received <int>,
#> #   clan_capital_contributions <int>, clan_tag <chr>, clan_name <chr>,
#> #   clan_clan_level <int>, clan_badge_urls <list>, league_id <int>, …
```

To get a clan, we can use:

``` r
clan <- coc_get_clan('8UC2J9OY')
clan
#> # A tibble: 1 × 36
#>   tag      name  type  description location_id location_name location_is_country
#>   <chr>    <chr> <chr> <chr>             <int> <chr>         <lgl>              
#> 1 #8UC2J9… Dust… invi… Chan: (v) …    32000249 United States TRUE               
#> # ℹ 29 more variables: location_country_code <chr>, is_family_friendly <lgl>,
#> #   badge_urls_small <chr>, badge_urls_large <chr>, badge_urls_medium <chr>,
#> #   clan_level <int>, clan_points <int>, clan_builder_base_points <int>,
#> #   clan_versus_points <int>, clan_capital_points <int>,
#> #   capital_league_id <int>, capital_league_name <chr>,
#> #   required_trophies <int>, war_frequency <chr>, war_win_streak <int>,
#> #   war_wins <int>, war_ties <int>, war_losses <int>, …
```

This returns clan-level attributes, such as lists of members in the
clan:

``` r
clan$member_list
#> [[1]]
#> # A tibble: 30 × 15
#>    tag        name      role  expLevel league       trophies builderBaseTrophies
#>    <chr>      <chr>     <chr>    <int> <list>          <int>               <int>
#>  1 #LVRULQ0   nick8997  coLe…      209 <named list>     4227                3795
#>  2 #92GCQQYP  christop… coLe…      209 <named list>     4135                3329
#>  3 #QVLJUUU2  OnePunch… coLe…      192 <named list>     3758                4303
#>  4 #JY2J2QP2  Evan1125  lead…      209 <named list>     3524                4050
#>  5 #LP0VGC92  bailey    coLe…      156 <named list>     2619                3551
#>  6 #JCPG0YC9  ZaeCraze… memb…      164 <named list>     2578                2625
#>  7 #8L9L0YL8Y Fiore     coLe…      157 <named list>     2354                3536
#>  8 #LCJQ0Y2CR Cefola    coLe…      116 <named list>     2305                2859
#>  9 #YQPCQ9RY  Regal     coLe…      156 <named list>     2276                2666
#> 10 #9RCGLLLY  Christop… admin      142 <named list>     1996                1733
#> # ℹ 20 more rows
#> # ℹ 8 more variables: versusTrophies <int>, clanRank <int>,
#> #   previousClanRank <int>, donations <int>, donationsReceived <int>,
#> #   playerHouse <list>, builderBaseLeague_id <int>,
#> #   builderBaseLeague_name <chr>
```

## Disclaimer

**This content is not affiliated with, endorsed, sponsored, or
specifically approved by Supercell and Supercell is not responsible for
it. For more information see Supercell’s Fan Content Policy:
\<www.supercell.com/fan-content-policy\>.**
