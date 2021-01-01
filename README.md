# Mutual-Funds-NAV-Analysis

## Introduction

This repository contains the scripts used to plot the graphs in the medium
article I wrote <here>. The scripts are numbered in the order of execution, and
you may have to edit some of the code (mostly comment and un-comment the respective
lines) in order to generate the plot you want.

## Brief information about what each script does

1.  The first script "Data Extraction.R" makes use of the "config.R" script in
    the "Utils" directory for downloading the data **as it is** from the
    [Association of Mutual Funds in India](https://www.amfiindia.com/nav-history-download)
    website. It then creates new CSV files that has only those columns that are
    relevant to the analysis.

2.  The second script "Data Filtering.R" creates new CSV(s) that has only those
    mutual funds that I wanted to analyze.

3.  The third script "Drawing Plots - Scatter Plot.R" generates scatter plots, as
    the name suggests. The data are divided by month and year, and I have marked
    the date on which the NAV was the lowest for that month. The colour used to
    mark the date is according to the period of the month in which the date falls
    (1-11, 12-21, 22-31). If there were more than one date in the same period for
    a month, I have marked the first occurring date. The legend of the plot
    displays the total number of dates in that period that had the lowest NAV.

4.  The fourth script "Drawing Plots - Bar Plot.R" generates the bar plots in the
    article. The code has a few lines commented out, that were used for drawing
    some of the plots.
