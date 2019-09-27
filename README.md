# Habits of Non-verbal Intimacy: reducing number of dimensions using factor analysis

*R, Data cleaning with dplyr, Likert scale analysis, Factor analysis with psych and polycor, visualization with semPlot and ggplot*

## Intro

This project is based on an analysis I did for my honors thesis in neuroscience: analyzing non-verbal behavior in a sample of depressed patients over 6 months of treatment. I had collected data on the frequencies of a number of non-verbal behaviors, and I wished to reduce the number of variables before performing furhter analysis. 

Factor analysis uncovers latent dimensions or "factors" from a large number of related variables. It can be used to reveal insights about which variables group together through positive and negative correlations. 

Since my original dataset contains sensitive patient data, I used here results from the [Nonverbal Immediacy Scale from Open Psychometrics](https://openpsychometrics.org/tests/NIS/).

## Setup

To run this project, you can use RStudio or run the Jupyter Notebook in a conda environment.


### To use RStudio:
- Clone this repo and run setup.R to install and attach the required packages

### To run the Jupyter Notebook in an conda environment: 
- Create my R environment from the environment.yml by cloning the repo, stepping into this project directory in the terminal, and running

```
conda env create -f environment.yml
```

OR

- Install packages from inside the Jupter Notebook (running the first few cells) 

## Results

