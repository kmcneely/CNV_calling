# Kelsey McNeely
# 1.7.2021


# Merge CNV calls by gene ID from two csv files

library(tidyverse)

args = commandArgs(trailingOnly=TRUE)

setwd("working directory")

if(length(args)!=2){
  stop("Wrong number of file inputs. Need 2 files.")
}else {
  
  donor <- args[1]
  recipient <- args[2]
  
  file1 <- read_csv(donor, col_types = cols(chromosome = col_character()))
  file2 <- read_csv(recipient, col_types = cols(chromosome = col_character()))
  
  mergedFiles <- merge(file1, file2, by.x="hgnc_symbol", by.y="hgnc_symbol")
  print("merged")
  
  
  write.csv(mergedFiles, file=paste0(paste('pairIntersect', substr(donor, 1, 5), substr(recipient, 1, 5), 'top200',  sep="_"), '.csv'), row.names = FALSE)
}
