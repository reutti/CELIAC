
require(dplyr)
require(alakazam)
library(readxl)

TEMP<-list.files(pattern=".tab")
clin<-read_xls("/localdata/Or/Or/UIO-Celiac.xls", sheet = 2)
#clin$Name<-sapply(clin$Name, function (x) strsplit(x,"UIO-")[[1]][2])
names(clin)[4]<-paste('HealthStatus')
ALL_SAMP<-data.frame(matrix(nrow=1,ncol=35))
A<-read.delim(TEMP[1],stringsAsFactors=F)
colnames(ALL_SAMP)<-colnames(A)

for (i in TEMP)
{
  
  A<-read.delim(i,stringsAsFactors=F)
  A$SAMPLE<-strsplit(i,"_genotyped")[[1]][1]
  clinA<-clin$HealthStatus[clin$Name==head(A$SAMPLE,n=1)]
  A$CLIN<-clinA
  sexA<-clin$Sex[clin$Name==A$SAMPLE]
  a$SEX<-sexA
  A<-aminoAcidProperties(A, seq="JUNCTION", nt=TRUE, trim=TRUE, 
                         label="CDR3")
  
  filen<-strsplit(i,".tab")[[1]][1]
  filenn<-paste0("/localdata/Reut",filen,"-props.tab")
  write.table(A,filenn,sep="\t",row.names=F)
  ALL_SAMP<-rbind(ALL_SAMP,A)
  
}

ALL_SAMP<-ALL_SAMP[2:nrow(ALL_SAMP), ]
