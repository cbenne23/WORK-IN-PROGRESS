data<-read.csv('ChrisBennett_Data.csv')

channel<-c("CHANNEL1_6M","CHANNEL2_6M","CHANNEL3_6M")

store<-NULL
for (word in channel){
  #print(word)
  rhs <- paste("data","$","Grp_",word, sep="")
  #var<-as.symbol(paste("Grp_",word,sep=""))
  #eval(parse(text=rhs))
  store<-c(store,rhs)
  
  
}

check<-NULL
for (object in store){
  #print(object)
  a <-paste(object,"<-","-1",sep="")
  check<-c(check,a)
  #parse(check)
}


for(cnr in 1:length(check)){
  
  #print(check[cnr])
  eval(parse(text=check[cnr]))
}
#names(data)
#data["Grp_CHANNEL1_6M"][which(data["CHANNEL1_6M"]==0),]<-"Match"

#summary(data,2)
head(data,2)
#test<-names(data["Grp_CHANNEL1_6M"])
#test
#summary(data)
#head(data)
#test<-"Grp_CHANNEL1_6M"
#str(test)
#typeof(test)
#test<-substr(test,5,15)
#test
group<-c("Grp_CHANNEL1_6M","Grp_CHANNEL2_6M","Grp_CHANNEL3_6M")

#if (any(data["CHANNEL1_6M"]==0)){data["Grp_CHANNEL1_6M"]<-"Match"} else{data["Grp_CHANNEL1_6M"]<-"No Match"}
#if (any(data["CHANNEL2_6M"]==0)){data["Grp_CHANNEL2_6M"]<-"Match"} else{data["Grp_CHANNEL2_6M"]<-"No Match"}
#if (any(data["CHANNEL3_6M"]==0)){data["Grp_CHANNEL3_6M"]<-"Match"} else{data["Grp_CHANNEL3_6M"]<-"No Match"}
#chec<-data[data$CHANNEL1_6M==1,]
#look<-data["CHANNEL1_6M"]==0
#look
transform <- function(data ){
  for (word in group){
    
    for (var in channel) {
      
      if(var == substr(word,5,15)){
        data[word][which(data[var]==0),]<-"Match"
        data[word][which(data[var]!=0),]<-"No Match"
        
      } 
     
        #ifelse((var == substr(word,5,15) & data[var] == 0),data[word]<-"Match",data[word]<-"No Match")
    }
  }
  
  return(data)

}

data<-transform(data)
#summary(data)
head(data,2)
