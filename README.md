<!-- README.md is generated from README.Rmd. Please edit that file -->
  
  # politicxsentwitteR 🐦📦  <img src="man/figures/logo.png" width="160px" align="right" />

![version](https://img.shields.io/badge/version-0.0.0.9-green) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)  ![](https://visitor-badge.glitch.me/badge?page_id=guadag12.politicxsentwitteR&style=flat-square&color=0088cc) 

  This is an R package called __"politicxsentwitteR"__. The idea is to download data of the application of ["Politicians on Twitter"](https://oderedes.shinyapps.io/politicosentwitter/) using R to make analysis. Feel free to share them with the hashtag #politicxsentwitteR @@
 
<!-- Use twitter from R. Get started by reading `vignette("rtweet")`. -->
  
  
  ## Installation 👇
  
  This is a package in a developed state. So, you can download using this code:
  
 ``` r 
library(devtools)
install_github("guadag12/politicxsentwitteR")
library(politicxsentwitteR)
```

## Usage 🌟

The best part is that there is no need to have the authentication to interact with Twitter’s APIs. You can easily access reusable data for most nationals public servants in Argentina. Find the [total list here!](https://github.com/guadag12/politicxsentwitteR/raw/main/data/politicxs_data.rda)

 
 ### Get the timeline of public servants 🤳 👇:
  
 Search for every tweet -including retweets- of one or more users:
 
 ``` r
 timeline <- get_timeline_data(screen.name = "alferdez")
 head(timeline)
 ```

 ### Get the timeline of all users in a category 🤳 👇
  
   Search for every tweet -including retweets- of one or more users in one or more categories ('all','deputies','national executive','others','province servants', 'senators')

 ``` r
 timelines_others_senators <- get_timeline_data_all(category = c('others','senators'))
 ```

 ### Get the evolution of friends and followers by day 👥:
  
   Get how many friends and followers win or lose every user by day :
  
   ``` r
 friends_followers_SM <- get_friends_followers(screen.name = "SergioMassa")
 ```

 ### Get the evolution of friends and followers by day in a specific category 👥:
  
   Get how many friends and followers win or lose every user by day all the functionaries or some of them based on which category they belong ('all','deputies','national executive','others','province servants', 'senators'):
  
   ``` r
 friends_followers_prov_national <- get_friends_followers_all(category = c('province servants','national executive' ),  historic = FALSE)
  ```

  Moreover, check the historic data of their friends and followers using the "historic" parameter, that's by default "FALSE".


 ### Get network data 🕸🤓:

  Get who retweets who in a given period of time:

  ``` r
  network <- get_network_data(category= "all", start_date= "2021-01-01", end_date = "2021-03-31")
  ```

 Select the category that you want to match and the start and end date of retweets.


## Shiny APP: [Politicos en Twitter](https://oderedes.shinyapps.io/politicosentwitter/) 🔷

Remember that this package came out as a possibility to download the data reusable and available on ["Politicians on Twitter"](https://oderedes.shinyapps.io/politicosentwitter/). That is a collaborative project between ["Observatorio de redes"](https://twitter.com/O_de_R), ["Democracia en Red"](https://twitter.com/fundacionDER) y ["National democratic Institute"](https://twitter.com/NDI) with the propuse to increase the production of knowledge about candidates, social media and desinformation 🙌


## Contact ❤️

If you encounter a bug please make an issue! Feel free to write me with doubts to my gmail: guadagonz12@gmail.com or send me a DM on Twitter: [guadag12](https://twitter.com/guadag12) 
