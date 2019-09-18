# Factor analysis of nonverbal behavior
### Language: R
*Data cleaning with dplyr, Likert scale analysis, Factor analysis with psych and polycor, visualization with semPlot and ggplot*

-Factor analysis uncovers a number of latent dimensions or "factors" from a large number of related variables. 
-I originally performed this analysis for a dataset recording the frequency of a number of nonverbal behaviors in patients recovering from depression over 6 months. However this data is sensitive patient data.
-I wanted to see how this analysis would work with data on the Nonverbal Immediacy Scale from Open Psychometrics <https://openpsychometrics.org/tests/NIS/>

### Run these lines to set the package requirements and version variables in RStudio. 
```{r}
req <- readLines("requirements.txt")
proj_version <- "R version 3.6.1 (2019-07-05)"
```

### Now run the setup.R file to install and attach packages


