
# Suzi Ross
# Center for Music in the Brain, Aarhus University
# suzi@clin.au.dk
# 4th October 2017

notes <- c("C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B")

# same or different
same <- rep("same", 5)
diff <- rep("different", 5)
samediff <- sample(c(same, diff), 10, rep = F)

# standard tone
std <- sample(notes, 10, rep = F)
df <- data.frame(cbind(samediff, std), stringsAsFactors = F)

# comparison tone
df$comp <- NULL

for( i in 1:nrow(df)){
  if(df$samediff[i] == "same"){
    df$comp[i] <- std[i]
  } 
  else{
    notestemp <- sample(notes, 1)
    while(std[i] == notestemp){
      notestemp <- sample(notes, 1)
    }
    df$comp[i] <- notestemp
    }
}


# interpolated tones
df$int1 <- NULL
df$int2 <- NULL
df$int3 <- NULL
df$int4 <- NULL
df$int5 <- NULL
df$int6 <- NULL
df$int7 <- NULL
df$int8 <- NULL

for( i in 1:nrow(df)){
    notestemp <- sample(notes, 8)
    while(sum(is.element(c(df$std[i], df$comp[i]), notestemp)) != 0){
      notestemp <- sample(notes, 8)
    }
    df$int1[i] <- notestemp[1]
    df$int2[i] <- notestemp[2]
    df$int3[i] <- notestemp[3]
    df$int4[i] <- notestemp[4]
    df$int5[i] <- notestemp[5]
    df$int6[i] <- notestemp[6]
    df$int7[i] <- notestemp[7]
    df$int8[i] <- notestemp[8]
}

# order df so std is first and comp is last
df <- df[,c(1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 3)]
write.csv(df, file="interpolated_tones_task.csv")

View(df)

