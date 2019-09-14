#the messy dataset contains NIS measures as well as demographic, ten item personality inventory, and word checks

#the word checks can be used to determine responses that aren't reliable (perhaps a person was not answering the survey thoughtfully or wasn't paying attention)


#first the data was split to remove the TIPI questions

#list column names:
colnames(messy_data)

#creates a dataset with just the NIS questions
NIS_clean<-messy_data[1:5000, ]%>% #take just the first 10,000 observations of this massive dataset
  select(c("Q1", "Q2", "Q3","Q4", "Q5", "Q6", "Q7",  "Q8",  "Q9",  "Q10", "Q11", "Q12", "Q13", "Q14", "Q15", "Q16", "Q17", "Q18", "Q19", "Q20", "Q21", "Q22", "Q23", "Q24", "Q25", "Q26", "VCL1", "VCL2", "VCL3", "VCL4", "VCL5", "VCL6", "VCL7", "VCL8", "VCL9",  "VCL10",  "VCL11", "VCL12",  "VCL13", "VCL14", "VCL15",  "VCL16"))%>% #select the actual columns, as well as the word recognition columns 
  filter_at(vars(c("VCL6", "VCL9","VCL12")), all_vars(.==0))%>% #these three variables are not real words. This keeps only observations where only all three were marked as unknown.
  filter_at(vars(starts_with("Q")), all_vars(.!=0))%>% #0 is not a valid option in the 1-5 likert scale for NIS items. This keeps only observations where none of the Qs were answered with 0.
  select(starts_with("Q"))%>% #retains only the NIS questions
  mutate_all(as.numeric)
summary(NIS_clean)
colSums(is.na(NIS_clean))

#checking the multivariate normality of the NIS variables using Henze-Zirkler's test and producing a qq plot
mvn(NIS_clean[1:5000, ], mvnTest = "hz", multivariatePlot = "qq") #takes only 5,000 obs

#they aren't normally distributed (which isnt surprising since this a likert scale dataset)
#therefore, pincipal axis method of extracting factors should be used (Norris)
