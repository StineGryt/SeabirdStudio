
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SeabirdStudio

An R package for exploring and comparing seabird colony/site community
composition.

## Installation

You can install SeabirdStudio from [GitHub](https://github.com/) with:

# install.packages(“pak”)

pak::pak(“StineGryt/SeabirdStudio”)

## Included data

The package includes a subset of seabird colony count data from the UK.

``` r
library(SeabirdStudio)
data("seabird_counts")
head(seabird_counts)
#>        colony                  species count
#> 1 Ailsa Craig              Common Gull     1
#> 2 Ailsa Craig            European Shag    64
#> 3 Ailsa Craig  Great Black-backed Gull    42
#> 4 Ailsa Craig             Herring Gull   213
#> 5 Ailsa Craig Lesser Black-backed Gull   189
#> 6 Ailsa Craig          Northern Fulmar   119
```

## Functions

### List available sites

``` r
list_colonies(seabird_counts)
#>  [1] "Ailsa Craig"                     "Berneray"                       
#>  [3] "Buchan Ness to Collieston"       "Calf of Eday"                   
#>  [5] "Canna and Sanday"                "Copinsay"                       
#>  [7] "Eilean Trodday"                  "Fair Isle"                      
#>  [9] "Faray"                           "Farne Islands"                  
#> [11] "Fladda"                          "Fladda Chuain to Gearran Island"
#> [13] "Foula"                           "Great Saltee Island"            
#> [15] "Handa Island"                    "Haskeir"                        
#> [17] "Hermaness"                       "Inishtrahull"                   
#> [19] "Lambay"                          "Noss"                           
#> [21] "Papa Stour Whole Island"         "Rathlin Island"                 
#> [23] "Sands of Forvie"                 "Stroma Island"                  
#> [25] "Tory Island"
```

### Species richness

``` r
species_richness(seabird_counts, "Foula")
#> [1] 9
```

### Relative abundance

``` r
relative_abundance(seabird_counts, "Ailsa Craig")
#> # A tibble: 7 × 2
#>   species                      prop
#>   <chr>                       <dbl>
#> 1 Common Gull              0.000559
#> 2 European Shag            0.0358  
#> 3 Great Black-backed Gull  0.0235  
#> 4 Herring Gull             0.119   
#> 5 Lesser Black-backed Gull 0.106   
#> 6 Northern Fulmar          0.0665  
#> 7 Razorbil                 0.649
```

### Colony similarity (Bray-Curtis similarity index)

``` r
colony_similarity(seabird_counts, "Lambay", "Foula")
#> [1] 0.1051094
```

## Shiny app

Launch the interactive app:

run_seabird_app()

## Description

This package provides simple tools for exploring seabird community
composition and comparing colonies/seabird sites using ecological
metrics.
