library(readr)
library(tidyverse)
library(stringr)
library(dplyr)
#0. read file

titanic3_df <- read_csv("/Users/Duane/Documents/Data Science- Springboard/Data Wrangling/Ex 2/titanic3.csv")
glimpse(titanic3_df)

titanic3_df <- titanic3_df %>%
  mutate(embarked = replace(embarked, is.na(embarked),"S")) %>%
  mutate(embarked = replace(embarked, embarked == "", "S")) %>%
  mutate(embarked = replace(embarked, embarked == " ", "S"))

titanic3_df <- titanic3_df %>%
  group_by(sex) %>%
  mutate(age= replace(age, is.na(age), mean(age, na.rm= TRUE))) %>%
  round(age)