---
title: "ReadMe"
author: "Erik Hemdal"
date: "Wednesday, September 17, 2014"
output: html_document
---

This is the instruction list for my final project submission.  To create the dataset, do the following steps:

- Choose a convenient working directory.
- Execute run_analysis.R using R v3.1.1 with dplyr v0.2 installed. 

I have tested this script on a Windows 7 PC, but not on other platforms.  The script requires Internet access because it downloads the original script before.  There are no other manual steps required to generate the cleaned up dataset.

Using the dataset:

The dataset was written with

write.table(result, file = "tidy_avg.txt", row.names = FALSE)

Read it with:

read.table("tidy_avg.txt", header = TRUE)



Files:
CodeBook.md:  The codebook file.
README.md: The instruction list (this file).
run_analysis.R: The script file.
