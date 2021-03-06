#Plotting time taken for running CoOccurrence(bigrams, n =2) word count on Latin Text
library(data.table)
library(ggplot2)

data1 <- read.table("spark_data_recorded_2.txt", header=T, sep="\t")
colnames(data1) <- c("Number.of.Documents", "Execution.Time.in.secs")
data1$n.grams <- "2-grams"

pltbase1 <- ggplot(data1, aes(Number.of.Documents, Execution.Time.in.secs)) + geom_point(color = "red", size = 2) + geom_line(data = data1, aes(x=Number.of.Documents, y=Execution.Time.in.secs))
pltbase1 + ggtitle("Word CoOccurrence(bigrams) on \n different amount of documents") + theme(plot.title = element_text(hjust = 0.5))


#Plotting time taken for running CoOccurrence(trigrams, n = 3) word count on Latin Text
data2 <- read.table("spark_data_recorded_3.txt", header=T, sep="\t")
colnames(data2) <- c("Number.of.Documents", "Execution.Time.in.secs")
data2$n.grams <- "3-grams"

pltbase2 <- ggplot(data2, aes(Number.of.Documents, Execution.Time.in.secs)) + geom_point(color = "blue", size = 2) + geom_line(data = data2, aes(x=Number.of.Documents, y=Execution.Time.in.secs))
pltbase2 + ggtitle("Word CoOccurrence(trigrams) on \n different amount of documents") + theme(plot.title = element_text(hjust = 0.5))





#Plotting time taken for running CoOccurrence(bigrams, n= 2 Vs trigrams, n = 3) word count on Latin Text
combined_data <- rbind(data1, data2)
pltbase3 <- ggplot(combined_data, aes(Number.of.Documents, Execution.Time.in.secs, colour = n.grams)) + 
            geom_line(aes(x=Number.of.Documents, y=Execution.Time.in.secs)) + 
            ylab(label="Execution.Time.in.secs") + 
            xlab("Number.of.Documents") + 
            scale_colour_manual(values=c("red", "blue")) 

pltbase3 + ggtitle("Word CoOccurrence(bigrams Vs trigrams) on \n different amount of documents") + theme(plot.title = element_text(hjust = 0.5))
