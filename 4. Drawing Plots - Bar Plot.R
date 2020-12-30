# Load libraries
library(dplyr)
library(ggplot2)
library(ggrepel)
library(lubridate)

# Read the data into a data frame
df_axis <- read.csv("./Data/Filtered Data/Axis.csv")

# Modify the "Date" column
df_axis <- mutate(df_axis, Date = dmy(Date))

df_axis <- mutate(df_axis,
                     Day.of.Month = mday(Date),
                     Month = month(Date, label = TRUE),
                     Year = year(Date))

funds <- unique(df_axis$Scheme.Name)

# Run through all fund names individually
for (i in 1:length(funds)) {
    # Create a subset of data frame with specific fund name
    df <- subset(df_axis, Scheme.Name == funds[i])
    # Add a column stating in which 1/3rd or 1/6th part of the month the
    # Day.of.Month lies
    df <- mutate(df, Section.of.Month = cut(Day.of.Month, breaks = 3,
                                            labels = c("1-11", "12-21", "22-31")))
    # df <- mutate(df, Section.of.Month = cut(Day.of.Month, breaks = 6,
    #                                         labels = c("1-6", "7-11", "12-16",
    #                                                    "17-21", "22-26", "27-31")))

    # Create a data frame with minimum NAV for each month for each year
    nav_min <- df %>% group_by(Year, Month) %>%
        summarise(Min = min(Net.Asset.Value))

    # Create a merged data frame to extract the Day of the month that has the minimum
    # NAV for that month, for that year
    mrg <- merge(df, nav_min,
                 by.x = c("Year", "Month", "Net.Asset.Value"),
                 by.y = c("Year", "Month", "Min"),
                 sort = FALSE, all = FALSE)
    # Add a column that is just Year.Month.Section.of.Month pasted together. This is
    # done to remove any duplicate occurrences of the minimum NAV in the same section
    mrg <- mrg %>%
        mutate(Separator = paste(mrg$Year, mrg$Month, mrg$Section.of.Month,
                                 sep = ".")) %>%
        subset(!duplicated(Separator))

    # Draw Bar Plot
    png(filename = paste0("./Plots/", funds[i], ".png"),
        width = 480*3, height = 480*2)

    g <- ggplot(data = mrg,
                mapping = aes(x = Section.of.Month, fill = Section.of.Month))
    g <- g + geom_bar(aes(fill = Section.of.Month))

    # Remove the ticks on X-axis when using Month in Facet
    g <- g + theme(axis.text.x = element_blank(),
                   axis.ticks.x = element_blank()) +
        labs(x = "Section of Month", y = "Count", title = funds[i])

    # Add facet
    # g <- g + facet_grid(. ~ Year)
    # g <- g + facet_grid(. ~ Month)

    print(g)

    dev.off()

}
