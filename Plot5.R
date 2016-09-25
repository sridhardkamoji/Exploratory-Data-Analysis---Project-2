# read the rds files
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

#subsetting the data
baltimore <- subset(nei, fips == "24510" & type == "ON-ROAD")
baltimore_sources <- with(baltimore, aggregate(Emissions, list(year = year), sum))
names(baltimore_sources) <- c("year", "Emissions")

#Generating the plot
g <- ggplot(baltimore_sources, aes(x = year, y = Emissions))
g <- g + geom_line() + xlab("year") + ylab("PM2.5 Emissions ON-ROAD") + ggtitle("Total PM2.5 Emissions in Baltimore City ON-ROAD")

#plotting the graph into png file
png("Plot5.png")
print(g)
dev.off()
