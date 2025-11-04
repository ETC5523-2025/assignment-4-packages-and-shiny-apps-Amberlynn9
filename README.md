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

The package contains the dataset hai_burden, derived from Table 2 of Zacher et al. (2019).
It provides estimates of healthcare-associated infection burden per 100 000 population, including:

- HAIs per 100 000 – number of healthcare-associated infections

- Deaths per 100 000 – deaths attributable to HAIs

- DALYs per 100 000 – disability-adjusted life years combining illness and early death

across five infection types (HAP, UTI, BSI, SSI, CDI) and three sampling groups (German PPS, German Convenience, ECDC EU/EEA).

``` r
data("hai_burden")
head(hai_burden)
```

The dataset was generated using tibble::tribble() and reshaped with tidyr::pivot_longer().
Random confidence intervals (ci_low, ci_high) were added to visualise uncertainty.
Finally, it was saved into the package using:
```r
usethis::use_data(hai_burden, overwrite = TRUE)

```

## 💻 Shiny App 

You can launch the interactive dashboard using:

``` r
run_app()
```

The app allows users to:

- Select measures and infection types

- Compare German and EU/EEA estimates

- Download filtered data for further analysis

- Interpret dynamic plots with explanatory text

Each bar in the chart represents the estimated infection burden per 100 000 people, with error bars showing uncertainty.
This helps visualise differences between regions and infection types.

## 🌐 Documentation Website
You can view the full documentation and vignette here:

👉 https://etc5523-2025.github.io/assignment-4-packages-and-shiny-apps-Amberlynn9/index.html

It includes:

- Function documentation (run_app, hai_burden)

- A vignette explaining data creation and app features

- Package overview and source reference


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
