library(ggvis)

#getwd()
#setwd("appData/Res_Challenge/Data")
input <- function(inputfile) {
  print("READING TABLE");
  parameters <<- read.table(inputfile, fill=TRUE, as.is=T);
  rownames(parameters) <<- parameters[,1];
  print(parameters);
#t1 <<- read.table(toString(parameters["training",2]), sep = "\t", header =FALSE, stringsAsFactors=FALSE)#, nrow=20000)
#  t2 <<- read.table(toString(parameters["clinical",2]), sep="\t", header = TRUE,  stringsAsFactors=FALSE)
print("READING TABLES")
t1 <<- read.table(parameters["clinical", 2], sep="\t", header = TRUE)
print("READING RMA")
rma <- read.table(parameters["training", 2], sep = "\t", header = FALSE)
print("MAKING FRAME")
rma <- as.data.frame(t(rma))
print("DONE")

colnames(rma)[2:ncol(rma)]<- as.matrix(rma[1,2:ncol(rma)])
colnames(rma)[1] <- "CEL"

print("READING TIME TABLE 1")
g1 = read.table(parameters["files", 2], sep = ' ', header = TRUE)
print("READING TIME TABLE 2")
g2 = read.table(parameters["files", 3], sep = ' ', header = TRUE)
print("READING TIME TABLE 3")
g3 = read.table(parameters["files", 4], sep = ' ', header = TRUE)
print("READING TIME TABLE 4")
g4 = read.table(parameters["files", 5], sep = ' ', header = TRUE)
print("READING TIME TABLE 5")
g5 = read.table(parameters["files", 6], sep = ' ', header = TRUE)
print("READING TIME TABLE 6")
g6 = read.table(parameters["files", 7], sep = ' ', header = TRUE)
print("READING TIME TABLE 7")
g7 = read.table(parameters["files", 8], sep = ' ', header = TRUE)
print("GENES")
sel_genes <<- as.data.frame(rma[, colnames(rma) %in% Reduce(union, c("CEL",row.names(g1), row.names(g2), row.names(g3), row.names(g4), row.names(g5), row.names(g6), row.names(g7)))])
}

run <- function() {
print("CEL")
fin<<-merge(t1, sel_genes, by = "CEL")
}
#Creating X and Y

output <- function(outputfile) {
Y = fin$SHEDDING_SC1
X = fin[13 : ncol(fin)]
write.csv(X, outputfile)

#print("VIZ")
#print(X)
#print(Y)
#Visualize
#fin %>% ggvis(~200593_s_at, ~200928_s_at, ~SHEDDING_SC1) %>% layer_points()

print("DONE")
}
#Classify

