#The polychoric correlation matrix is an estimates the theorized correlations between pairs of ordinal variables. This matrix will be used in place of a correlation matrix in the factor analysis. 
NIS_m<-data.matrix(NIS_clean) #save data as matrix
pcor<-polycor::hetcor(NIS_m, ML = T)$correlations #extract the polychoric correlation matrix

#to determine how many factors to extract, parallel analysis compares the scree polt of successive eigenvalues of the observed data to a random matrix of the same size. 
psych::fa.parallel(pcor, n.obs = 3633, fm = "pa", fa = "fa")
#suggests that the number of factors should be 8

#this performs the factor analysis:
fac <- psych::fa(pcor, nfactors=8, fm="pa", n.obs=3633, rotate="oblimin")
#the factor method is "pa", which stands for Principal Axis. The PA factor method is best for non-normally distributed data.
#the rotation is "oblimin", a standard oblique rotation, meaning that the it allows the extracted factors to be correlated with each other. I chose "oblimin" because factors in this dataset are all related to a common construct and are likely to be correlated. The purpose of rotations is to "obtain simple structure in order to enhance interpretability of the solution" (Norris). 

print(fac)
#this model is a good fit: root mean square of residuals is 0.01, the Tucker Lewis index is 0.95, and RMSEA index is < 0.05







