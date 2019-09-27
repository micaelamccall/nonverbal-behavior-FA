# Factor analysis of nonverbal behavior
### Language: R
*Data cleaning with dplyr, Likert scale analysis, Factor analysis with psych and polycor, visualization with semPlot and ggplot*

- Factor analysis uncovers a number of latent dimensions or "factors" from a large number of related variables. 
- I originally performed this analysis for a dataset recording the frequency of a number of nonverbal behaviors in patients recovering from depression over 6 months. However this data is sensitive patient data.
- I wanted to see how this analysis would work with data on the Nonverbal Immediacy Scale from [Open Psychometrics](https://openpsychometrics.org/tests/NIS/)

## Setup

To run this project, you can use RStudio or run the Jupyter Notebook in a conda environment.


### To use RStudio:
- Clone this repo and run setup.R to install and attach the required packages

### To run the Jupyter Notebook in an conda environment: 
- Create my R environment from the environment.yml by running

```
conda env create -f environment.yml
```

OR

- Install packages from inside the Jupter Notebook (running the first few cells) or by running from the terminal
 ```
conda install -c r package-name
```