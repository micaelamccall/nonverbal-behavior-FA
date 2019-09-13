#set url:
url<-"https://openpsychometrics.org/_rawdata/NIS_data.zip"

#create temporary file to store the zipped file:
temp<-tempfile()

#download file:
download.file(url, temp)

#this unzips the file into the working directory
unzip(temp)

#loads the data into the workspace
messy_data<-read.delim("NIS_data/data.csv", na.strings = c("", "NA"))

#clean up by removing temp and url
rm(temp,url)
