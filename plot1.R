#read the source datafile
filename<- "payments.csv"
if(!file.exists(filename)){
        payment_data <- read.csv("./data/payments.csv")    
}

# select data for plot1
payment_NY <- subset(payment_data,Provider.State == "NY")
attach(payment_NY)

#draw plot1,  write to a pdf file device
pdf("plot1.pdf",width=7,height=5)
with(payment_NY,plot(payment_NY$Average.Total.Payments/1000,payment_NY$Average.Covered.Charges/1000 ,main="Relationship between Mean covered charges \n and Mean total payments \nin New York",xlab = "Mean total payments in K$",ylab="Mean covered charges in K$",font.main=1,cex=0.5))

dev.off()
