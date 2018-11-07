Videos:

- [Jenny Bryan: Behind every great plot there's a great deal of wrangling](https://www.youtube.com/watch?v=4MfUCX_KpdE)
- [Hadley Wickham: Managing many models with R](https://www.youtube.com/watch?v=rz3_FDVt9eg)

ggplot gallery:
[http://www.ggplot2-exts.org/gallery/]

Read from RData - example
```
file_url <- 'http://varianceexplained.org/files/trump_tweets_df.rda'
file_name <- 'data/trump_tweets.rda'
if (!file.exists(file_name)) download.file(file_url, file_name)
load(file_name)
```

Read from csv - example:
```
file_url <- 'https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv'
file_name <- 'data/msleep_ggplot2.csv'
if (!file.exists(file_name)) download.file(file_url, file_name)
mspleep <- read_csv(file_name)
```
