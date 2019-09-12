#set url:
url<-"https://openpsychometrics.org/_rawdata/NIS_data.zip"

#create temporary file to store the zipped file:
temp<-tempfile()

#download file:
download.file(url, temp)

#unzip and load data
data<-read.delim(unzip(temp, "NIS_data/data.csv"))

#save codebook as a txt in home dir
write.table(readLines(unzip(temp, "NIS_data/codebook.txt")), "codebook.txt", row.names = F, col.names = F)

#clean up
rm(temp,url)
