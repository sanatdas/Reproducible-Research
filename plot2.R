#read the source datafile
filename<- "payments.csv"
if(!file.exists(filename)){
        payment_data <- read.csv("./data/payments.csv")    
}

attach(payment_data)
#set the graphical paramets
par(mfrow = c(2, 3))
par(cex = 0.6)
par(mar = c(0, 0, 0, 0), oma = c(15,5, 6, 4),xpd=NA)

state <- split(payment_data,payment_data$Provider.State)
for (i in 1:6) {
        tmpdf <- state[[i]]
        sname<-names(state)[i]
        plot(tmpdf$Average.Total.Payments/1000,tmpdf$Average.Covered.Charges/1000,xlab="",ylab="",
             ylim=c(0,200),pch=16,col=payment_NY$DRG.Definition)
        mtext(letters[i], side = 3, line = -1, adj = 0.1, cex = 0.6)
        legend("topleft",legend=sname,text.font=0.05,cex=0.8,pt.cex=0.7)
}
title("Relationship between \n mean total payments and mean covered charges\n by state and medical condition",xlab = "- Mean total payments in K$ -",ylab="- Mean covered charges in K$ -",font.main=2,font.lab=1, cex.lab=1.5,outer=TRUE)
# add the legend to the graphs
legend(x=-40,y=-70,legend=levels(payment_NY$DRG.Definition),col=c(1:6),pch=16,title="Diagnosis Related Group",title.col="blue",xpd=NA)

dev.copy(pdf,file="plot2.pdf")
dev.off()

##reset parameters
par <- par(mar=c(4,4,4,2))
par <- par(oma=c(0,0,0,0))
par <- par(mfrow=c(1,1))
par(xpd=FALSE)

