#to determine how many factors to extract, parallel analysis compares the scree polt of successive eigenvalues of the observed data to a random matrix of the same size. Parallel poly does this for polychoric analyses.
NIS_m<-data.matrix(NIS_clean) #save data as matrix
pcor<-polycor::hetcor(NIS_m, ML = T)$correlations #extract the polychoric correlation matrix
psych::fa.parallel(pcor, n.obs = 3633, fm = "pa", fa = "fa")
#suggests that the number of factors should be 8

#this performs the factor analysis:
fac <- psych::fa(pcor, nfactors=8, fm="pa", n.obs=3633, rotate="oblimin")
#the factor method is "pa", which stands for Principal Axis. The PA factor method is best for non-normally distributed data.
#the rotation is "oblimin", which is a type of oblique rotation, meaning that the it allows the extracted factors to be correlated with each other. I chose "oblimin" because factors in this dataset are all related to a common construct and are likely to be correlated, and "oblimin" is a standard oblique rotation and the default in the fa function.The purpose of rotations is to "obtain simple structure in order to enhance interpretability of the solution" (Norris). 

#this saves the factor loadings to a data frame
fa_loadings <- fac$loadings%>%
  as.table()%>%
  as.data.frame()%>%
  filter(Freq>=0.3)%>%
  spread(Var2, Freq)

print(fac)
#this model is a good fit: root mean square of residuals is 0.01, the Tucker Lewis index is 0.95, and RMSEA index is < 0.05

library(lavaan)
model<-'PA1 =~ Q15 + Q3 + Q11
PA2 =~ Q14 + Q1 + Q13
PA3 =~ Q16 + Q10 + Q21
PA4 =~ Q17 + Q22
PA5 =~ Q18 + Q9
PA6 =~ Q5 + Q26
PA7 =~ Q12 + Q19
PA8 =~ Q25'

fit<-cfa(model,sample.cov = pcor, sample.nobs = 3633, sample.mean=colMeans(NIS_clean),std.lv=TRUE, estimator="MLM")
#different estimators can be used. MLM is one that is good for non-normally distributed data
summary(fit1,fit.measures=TRUE,standardized=TRUE)
#factor diagram

library(semPlot)     
model<-semPlotModel(fac$loadings)
semPaths(model,what="par",whatLabels="est", rotation=4, minimum=0.3, sizeMan=5, sizeMan2 = 2, edge.width =.3)




