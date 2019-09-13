#to determine how many factors to extract, parallel analysis compares the scree polt of successive eigenvalues of the observed data to a random matrix of the same size. Parallel poly does this for polychoric analyses.
cor<-psych::polychoric(NIS_clean)$rho #extract the polychoric correlation matrix
psych::fa.parallel(cor, n.obs = 3633, fm = "pa", fa = "fa", cor = "poly")
#suggests that the number of factors should be 8


#principal axis factor analysis is best for non-normally distributed data
#the purpose of rotations is to "obtain simple structure in order to enhance interpretability of the solution" (Norris)

#oblique rotatins allow factors to be correlated. Because factors in this dataset are all related to a common construct and are likely to be correlated, I chose to use the "oblimin" rotation, which is a standard oblique rotation and the default in the fa function.

fac <- psych::fa(cor, nfactors=8, fm="pa", n.obs=3633, rotate="oblimin")
psych::fa.sort(fac$loadings)
psych::fa.diagram(fac)

fac2 <-psych::fa(cor, nfactors=7, fm="pa", n.obs=3633, rotate="oblimin")
psych::fa.sort(fac2$loadings)
psych::fa.diagram(fac2)
