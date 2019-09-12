#set url:
url<-"https://openpsychometrics.org/_rawdata/NIS_data.zip"

#create temporary file to store the zipped file:
temp<-tempfile()

#download file:
download.file(url, temp)

#unzip file
unzip(temp)


#load data
data<-read.delim("NIS_data/data.csv")

#clean up
rm(temp,url)
