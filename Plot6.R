# read the rds files
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

#subsetting the data
nei_sub <- subset(nei, fips == c("24510", "06037") & type == "ON-ROAD")
aggregated <- with(nei_sub, aggregate(Emissions, list(year = year, fips = fips), sum))

#Generating the plot
g <-  qplot(year, Emissions, data = aggregated, color = fips, geom = "line")
g <- g + xlab("year") + ylab("Emissions") + ggtitle("Total PM2.5 Emissions in Baltimore City(24510) and Los Angeles(06037) ON-ROAD")

#plotting the graph into png file
png("Plot6.png", width = 600, height = 480)
print(g)
dev.off()
