library("wordcloud")
library(tidyverse)
library(rtweet)

im <- get_timeline("IreneMontero", n = 3200)
m<-im %>% filter(is_retweet=="FALSE") %>% pull(hashtags)  %>% unlist() %>% table() %>% names()
v<-im %>% filter(is_retweet=="FALSE") %>% pull(hashtags)  %>% unlist() %>% table() %>% as.numeric()
d<-data.frame(m,v) %>% arrange(v)
wordcloud(words = d$m, freq = d$v, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))