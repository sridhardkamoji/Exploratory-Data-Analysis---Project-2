# read the rds files
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

#subsetting the data
scc_sub <- scc[grep("Coal", scc$Short.Name), ]
nei_sub <- nei[nei$SCC %in% scc_sub$SCC, ]

#Generating the plot
g <- ggplot(nei_sub, aes(x = factor(year), y = Emissions, fill = type))
g <- g + geom_bar(stat = "identity", width = 0.4) + xlab("year") + ylab("Coal Related PM2.5 Emissions") + ggtitle("Total Coal Related PM2.5 Emissions")


#plotting the graph into png file
png("Plot4.png")
print(g)
dev.off()
