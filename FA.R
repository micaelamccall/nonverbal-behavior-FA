cor<-psych::polychoric(NIS_clean)$rho
#to determine how many factors to extract, parallel analysis compares the scree polt of successive eigenvalues of the observed data to a random matrix of the same size. Parallel poly does this for polychoric analyses.
psych::fa.parallel(cor, n.obs = 3633, fm = "pa", fa = "fa", cor = "poly")

#nFactors finds and plots several alternative estimates that are used to determine the appropriate number of factors in EFA
psych::nfactors(m, n=5, rotate = "oblimin", fm = "pa", cor = "poly")


#principal axis factor analysis is best for non-normally distributed data
#the purpose of rotations is to "obtain simple structure in order to enhance interpretability of the solution" (Norris)

#oblique rotatins allow factors to be correlated. Because factors in this dataset are all related to a common construct and are likely to be correlated, I chose to use the "oblimin" rotation, which is a standard oblique rotation and the default in the fa function.
