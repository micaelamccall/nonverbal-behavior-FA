#set up list of questions
questions<-vector(mode = "list", length =26)
names<-vector(mode = "character", length = 26)
temp<-readLines("NIS_data/codebook.txt")[9:34]
for (i in 1:26){
  names[i]<-strsplit(temp[i], '\t')[[1]][1]
  questions[i]<-strsplit(temp[i], '\t')[[1]][2]
  names(questions)<-names
}
rm(i,temp,names)


for (i in 1:length(fa_loadings$Var1)){
  print(fa_loadings$Var1[[i]])
}
