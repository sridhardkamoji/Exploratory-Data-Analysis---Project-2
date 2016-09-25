# read the rds files
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")
 
#subset baltimore city data
baltimore <- nei[nei$fips == "24510", ]

# aggregating Baltimore city data frame according to year
bal_aggregated <- with(baltimore, aggregate(Emissions, by = list(year = year, type = type), sum))
names(bal_aggregated)[3] = "Emissions"

#Constructing the plot
library(ggplot2)
g <- ggplot(data = bal_aggregated, aes(x = year, y = Emissions, color = type))
g <- g + geom_point() + geom_line()
g <- g + ggtitle("Total PM2.5 Emissions in Baltimore City as per Source Type"

#plotting the graph into png file
png("Plot3.png", height = 480, width = 480)
print(g)
dev.off()

