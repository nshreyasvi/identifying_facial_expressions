rm(list=ls())
library("reshape2")
library("ggplot2")
library("dplyr") # or library("tidyverse")

test_data <- read.csv("/home/natraj/neural_network/Kenza_paper/csv_mean/Thibault_Tire_Langue_mean.csv", sep=',', header = F)
#test_data <- test_data %>% mutate(id = row_number())
#test_data_long <- melt(test_data,id="id")  # convert to long format

test_data$V1 <- str_replace_all(test_data$V1, "angry0", "Anger")
test_data$V1 <- str_replace_all(test_data$V1, "disgust0", "Disgust")
test_data$V1 <- str_replace_all(test_data$V1, "fear0", "Fear")
test_data$V1 <- str_replace_all(test_data$V1, "happy0", "Happiness")
test_data$V1 <- str_replace_all(test_data$V1, "neutral0", "Neutral")
test_data$V1 <- str_replace_all(test_data$V1, "sad0", "Sadness")
test_data$V1 <- str_replace_all(test_data$V1, "surprise0", "Surprise")

x <- test_data$V1
y <- test_data$V2

data <- data.frame(x, y)
data$y <- as.numeric(as.character(data$y))

data$category <- ifelse(as.numeric(data$y)<0, 0, 1)
data$category <- as.factor(data$category)

#Graph
library(cowplot) #theme
library(ggplot2)

ggplot(data, aes(x=x, y=y,fill=x))+ 
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(colour = "black"))+
  xlab("Emotion")+
  ylab("Mean Confidence")+
  ylim(0,1)+
  theme(legend.position="none")+
  ggtitle("Thibault_Tire_Langue_mean")+
  theme(plot.title = element_text(hjust = 0.5))
  

