# etc5523nhu

This R package contains data and a Shiny app for exploring the burden of
healthcare-associated infections (HAIs) in Germany and the EU/EEA
(Zacher et al., 2019).\
It was created as part of ETC5523 Assignment 4: *Turning Analysis
Interactive*.

------------------------------------------------------------------------

## 📦 Installation

You can install this package directly from GitHub using the `remotes`
package:

``` r
# install.packages("remotes")
remotes::install_github("ETC5523-2025/assignment-4-packages-and-shiny-apps-Amberlynn9")
```

Then load it:

``` r
library(etc5523nhu)
```

## 📊 Dataset

The package includes the dataset hai_burden, based on *Table 2* from
Zacher et al. (2019), which reports the estimated annual burden of
healthcare-associated infections (HAIs) per 100,000 population.

You can load and explore it like this:

``` r
data("hai_burden")
head(hai_burden)
```

The dataset includes measures such as:

-   HAIs per 100,000

-   Attributable deaths per 100,000

-   DALYs per 100,000 across infection types (HAP, UTI, BSI, SSI, CDI)
    and samples (German PPS, German Convenience, ECDC EU/EEA).

## 💻 Shiny App 

You can launch the interactive dashboard using:

``` r
run_app()
```

The app allows users to:

-   Select infection types and compare metrics

-   Explore differences between German PPS, German Convenience, and ECDC
    samples

-   Interpret the results visually with clear descriptions and legends

## 🌐 Documentation Website

Full function documentation, vignettes, and dataset details will be
available through the pkgdown website (link to be added after
publishing).

## 📚 Reference

Zacher B., Haller S., Willrich N., Walter J., Abu Sin M., Cassini A.,
Plachouras D., Suetens C., & Eckmanns T. (2019). Application of a new
methodology and R package reveals a high burden of healthcare-associated
infections in Germany compared to the average in the EU/EEA, 2011–2012.
EuroSurveillance, 24(46): 1900135.
<https://www.eurosurveillance.org/content/10.2807/1560-7917.ES.2019.24.46.1900135>

## 🪪 License

This package is released under the MIT License. See the LICENSE file for
details.
