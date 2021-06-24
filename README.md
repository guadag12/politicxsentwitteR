<!-- README.md is generated from README.Rmd. Please edit that file -->

# Políticxs en Twitter 🔷📦 <img src="man/figures/logo.png" width="160px" align="right" />

This is a test for a future package of [Shiny App "Politicians on Twitter"](https://oderedes.shinyapps.io/politicosentwitter/). The idea is to download every data of the application using R.

<!-- Use twitter from R. Get started by reading `vignette("rtweet")`. -->


## Installation 👇

This is a package in a developed state. So, you can download using this code:

``` 
library(devtools)
install_github("guadag12/politicxsentwitteR")
```

## Usage 🌟

The best part is that there is no need to have the authentication to interact with Twitter’s APIs. You can easily access reusable data for most nationals public servants in Argentina. Find the [total list here!](https://github.com/Guadag12/polentw/raw/master1/data/data_politicos.rda)

*Tabspace* ### Get the timeline of public servants 🤳 👇: 

*Tabspace* Search for every tweet -including retweets- of one or more users:

*Tabspace* ``` r
*Tabspace* timeline <- get_timeline_data(screen.name = "alferdez")
*Tabspace* ```

*Tabspace* ### Get the timeline of all users in a category 🤳 👇

*Tabspace* Search for every tweet -including retweets- of one or more users in one or more categories ('all','deputies','national executive','others','province servants', 'senators')

*Tabspace* ``` r
*Tabspace* timelines_others_senators <- get_timeline_data_all(category = c('others','senators'))
*Tabspace* ```

*Tabspace* ### Get the evolution of friends and followers by day 👥:

*Tabspace* Get how many friends and followers win or lose every user by day :

*Tabspace* ``` r
*Tabspace* friends_followers_SM <- get_friends_followers(screen.name = "SergioMassa")
*Tabspace* ```

*Tabspace* ### Get the evolution of friends and followers by day in a specific category 👥:

*Tabspace* Get how many friends and followers win or lose every user by day all the functionaries or some of them based on which category they belong ('all','deputies','national executive','others','province servants', 'senators'):

*Tabspace* ``` r
*Tabspace* friends_followers_prov_national <- get_friends_followers_all(category = c('province servants','national executive' ),  historic = FALSE)
*Tabspace*  ```

*Tabspace*  Moreover, check the historic data of their friends and followers using the "historic" parameter, that's by default "FALSE".


*Tabspace* ### Get network data 🕸🤓:

*Tabspace*  Get who retweets who in a given period of time:

*Tabspace*  ``` r
*Tabspace*  network <- get_network_data(category= "all", start_date= "2021-01-01", end_date = "2021-03-31")
*Tabspace*  ```

*Tabspace* Select the category that you want to match and the start and end date of retweets.


## Shiny APP: [Politicos en Twitter](https://oderedes.shinyapps.io/politicosentwitter/) 🔷

Remember that this package came out as a possibility to download the data reusable and available on ["Politicians on Twitter"](https://oderedes.shinyapps.io/politicosentwitter/). That is a collaborative project between ["Observatorio de redes"](https://twitter.com/O_de_R), ["Democracia en Red"](https://twitter.com/fundacionDER) y ["National democratic Institute"](https://twitter.com/NDI) with the propuse to increase the production of knowledge about candidates, social media and desinformation 🙌


## Contact ❤️

If you encounter a bug please make an issue! Feel free to write me with doubts to my gmail: guadagonz12@gmail.com or send me a DM on Twitter: [guadag12](https://twitter.com/guadag12) 
