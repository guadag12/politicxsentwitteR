<!-- README.md is generated from README.Rmd. Please edit that file -->
  
  # Políticxs en Twitter 🔷📦 <img src="man/figures/logo.png" width="160px" align="right" />
  
  This is a the repository of the R package __"politicxsentwitteR"__. The idea is to download every data of the application of ["Politicians on Twitter"](https://oderedes.shinyapps.io/politicosentwitter/) using R.

<!-- Use twitter from R. Get started by reading `vignette("rtweet")`. -->
  
  
  ## Installation 👇
  
  This is a package in a developed state. So, you can download using this code:
  
 ``` r 
library(devtools)
install_github("guadag12/politicxsentwitteR")
```

## Usage 🌟

The best part is that there is no need to have the authentication to interact with Twitter’s APIs. You can easily access reusable data for most nationals public servants in Argentina. Find the [total list here!](https://github.com/Guadag12/polentw/raw/master1/data/data_politicos.rda)

 
 ### Get the timeline of public servants 🤳 👇:
  
 Search for every tweet -including retweets- of one or more users:
 
 ``` r
 timeline <- get_timeline_data(screen.name = "alferdez")
 head(timeline)
    user_id           status_id          created_at screen_name
1 149991703 1132797204488433664 2019-05-26 23:54:34    alferdez
2 149991703 1133118888990924800 2019-05-27 21:12:50    alferdez
3 149991703 1133890787618512896 2019-05-30 00:20:05    alferdez
4 149991703 1137880822546124802 2019-06-10 00:35:03    alferdez
5 149991703 1138143400518176768 2019-06-10 17:58:27    alferdez
6 149991703 1141773523117137921 2019-06-20 18:23:15    alferdez
                                                                                                                                                                                                            text
1 “Quisiera que Macri empiece a explicar su modo de corrupción. Ha permitido que todos sus ministros se lleven la plata al exterior mientras los argentinos hacen el esfuerzo” @alferdez https://t.co/sahcW3Gb1y
2                                                                                                                                                                                        https://t.co/wIfMNOFXUI
3                                                                                 @ZamoraJulio @CFKArgentina @Kicillofok @magariovero Gracias Julio, un placer recibirte, juntos vamos a sacar el país adelante.
4                                                                                          Felicitaciones @bordet por tu merecidisimo triunfo. \n\nEl pueblo de Entre Ríos renovó su esperanza. Vamos Argentina.
5                                                                                                                                                Las Abuelas son lo mejor que tenemos. \n\nBienvenido nieto 130.
6                                                                                                                                                              ¡Feliz Día de la Bandera! https://t.co/8b04UV9uEG
              source is_quote is_retweet favorite_count retweet_count lang
1 Twitter for iPhone    FALSE       TRUE              0          1482   es
2 Twitter for iPhone    FALSE      FALSE           2261           472  und
3 Twitter for iPhone    FALSE      FALSE            310            77   es
4 Twitter Web Client    FALSE      FALSE           5996          1371   es
5 Twitter Web Client    FALSE      FALSE          23312          4702   es
6    Twitter Web App    FALSE      FALSE           2525           519   es
                                               status_url              name
1 https://twitter.com/alferdez/status/1132797204488433664 Alberto Fernández
2 https://twitter.com/alferdez/status/1133118888990924800 Alberto Fernández
3 https://twitter.com/alferdez/status/1133890787618512896 Alberto Fernández
4 https://twitter.com/alferdez/status/1137880822546124802 Alberto Fernández
5 https://twitter.com/alferdez/status/1138143400518176768 Alberto Fernández
6 https://twitter.com/alferdez/status/1141773523117137921 Alberto Fernández
                                         mentions_user_id
1                                      748334828978839553
2                                                    <NA>
3 c("161047617", "138814032", "2953955753", "1584076484")
4                                               134232117
5                                                    <NA>
6                                                    <NA>
                                           mentions_screen_name   retweet_status_id
1                                                alferdezprensa 1132787189383876614
2                                                          <NA>                <NA>
3 c("ZamoraJulio", "CFKArgentina", "Kicillofok", "magariovero")                <NA>
4                                                        bordet                <NA>
5                                                          <NA>                <NA>
6                                                          <NA>                <NA>
                                                                                                                                                                                                    retweet_text
1 “Quisiera que Macri empiece a explicar su modo de corrupción. Ha permitido que todos sus ministros se lleven la plata al exterior mientras los argentinos hacen el esfuerzo” @alferdez https://t.co/sahcW3Gb1y
2                                                                                                                                                                                                           <NA>
3                                                                                                                                                                                                           <NA>
4                                                                                                                                                                                                           <NA>
5                                                                                                                                                                                                           <NA>
6                                                                                                                                                                                                           <NA>
   retweet_created_at     retweet_source retweet_favorite_count retweet_retweet_count
1 2019-05-26 23:14:46 Twitter for iPhone                   3207                  1482
2                <NA>               <NA>                   <NA>                  <NA>
3                <NA>               <NA>                   <NA>                  <NA>
4                <NA>               <NA>                   <NA>                  <NA>
5                <NA>               <NA>                   <NA>                  <NA>
6                <NA>               <NA>                   <NA>                  <NA>
     retweet_user_id retweet_screen_name             retweet_name retweet_followers_count
1 748334828978839553      alferdezprensa Alberto Fernández Prensa                  322485
2               <NA>                <NA>                     <NA>                    <NA>
3               <NA>                <NA>                     <NA>                    <NA>
4               <NA>                <NA>                     <NA>                    <NA>
5               <NA>                <NA>                     <NA>                    <NA>
6               <NA>                <NA>                     <NA>                    <NA>
  retweet_friends_count retweet_statuses_count                           retweet_location
1                     1                   9659 Ciudad Autónoma de Buenos Aires, Argentina
2                  <NA>                   <NA>                                       <NA>
3                  <NA>                   <NA>                                       <NA>
4                  <NA>                   <NA>                                       <NA>
5                  <NA>                   <NA>                                       <NA>
6                  <NA>                   <NA>                                       <NA>
                                                                 retweet_description
1 Cuenta oficial de prensa y difusión de @alferdez. Contacto: prensa@alferdez.com.ar
2                                                                               <NA>
3                                                                               <NA>
4                                                                               <NA>
5                                                                               <NA>
6                                                                               <NA>
  retweet_verified  reply_to_status_id reply_to_user_id reply_to_screen_name urls_url
1             TRUE                <NA>             <NA>                 <NA>     <NA>
2             <NA> 1133118874646454272        149991703             alferdez     <NA>
3             <NA> 1133855984076697601        161047617          ZamoraJulio     <NA>
4             <NA>                <NA>             <NA>                 <NA>     <NA>
5             <NA>                <NA>             <NA>                 <NA>     <NA>
6             <NA> 1141773509972103170        149991703             alferdez     <NA>
  urls_t_co
1      <NA>
2      <NA>
3      <NA>
4      <NA>
5      <NA>
6      <NA>
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
