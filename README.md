# etc5523nhu

This R package contains data and a Shiny app for exploring the burden of healthcare-associated infections (HAIs) in Germany and the EU/EEA (Zacher et al., 2019).  
It was created as part of ETC5523 Assignment 4: *Turning Analysis Interactive*.

---

## 📦 Installation

You can install this package directly from GitHub using the `remotes` package:


```r
# install.packages("remotes")
remotes::install_github("your-github-username/etc5523nhu")
```

Then load it:

```r
library(etc5523nhu)
```

📊 Dataset
The package includes the dataset hai_burden, based on Table 2 from Zacher et al. (2019).
You can load it with:

```r
data("hai_burden")
head(hai_burden)
```

💻 Shiny App
You can launch the interactive dashboard using:

```r
run_app()
```

This app allows users to explore infection burden measures (HAIs per 100k, deaths per 100k, and DALYs per 100k) across different samples and infection types.

📖 Documentation Website
The package documentation and vignette are available here:
👉 pkgdown site link will go here once built

📚 Reference
Zacher B., Haller S., Willrich N., Walter J., Abu Sin M., Cassini A., Plachouras D., Suetens C., & Eckmanns T. (2019).
Application of a new methodology and R package reveals a high burden of healthcare-associated infections in Germany compared to the average in the EU/EEA, 2011–2012.
EuroSurveillance, 24(46): 1900135.
https://www.eurosurveillance.org/content/10.2807/1560-7917.ES.2019.24.46.1900135
