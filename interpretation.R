#this saves the factor loadings to a data frame
fa_loadings <- fac$loadings%>%
  as.table()%>%
  as.data.frame()%>%
  filter(Freq>=0.3 | Freq<=-0.3)%>%
  arrange(desc(Var2))

colnames(fa_loadings)<-c("Question", "Factor", "Loading")

#set up list of questions
questions<-vector(mode = "list", length =26)
qnames<-vector(mode = "character", length = 26)
temp<-readLines("NIS_data/codebook.txt")[9:34]
for (i in 1:26){
  qnames[i]<-strsplit(temp[i], '\t')[[1]][1]
  questions[i]<-strsplit(temp[i], '\t')[[1]][2]
  names(questions)<-qnames
}
rm(i,temp,qnames)

fa_loadings$Question_txt<-factor(NA,levels = c("I use my hands and arms to gesture while talking to people. ","I touch others on the shoulder or arm while talking to them. ","I use a monotone or dull voice while talking to people. ","I look over or away from others while talking to them. ","I move away from others when they touch me while we are talking. ","I have a relaxed body position when I talk to people. ", "I frown while talking to people. ","I avoid eye contact while talking to people. ", "I have a tense body position while talking to people. ","I sit close or stand close to people while talking with them. ","My voice is monotonous or dull when I talk to people. ","I use a variety of vocal expressions when I talk to people. ", "I gesture when I talk to people. ","I am animated when I talk to people. ","I have a bland facial expression when I talk to people. ","I move closer to people when I talk to them. ","I look directly at people while talking to them. ","I am stiff when I talk to people. ","I have a lot of vocal variety when I talk to people. ","I avoid gesturing while I am talking to people. ","I lean toward people when I talk to them. ","I maintain eye contact with people when I talk to them. ","I try not to sit or stand close to people when I talk with them. ","I lean away from people when I talk to them. ","I smile when I talk to people. ","I avoid touching people when I talk to them."))
levels(fa_loadings$Question_txt)

for (i in unique(fa_loadings$Question)){
  fa_loadings$Question_txt[fa_loadings$Question==i]<-as.character(questions[i])
}