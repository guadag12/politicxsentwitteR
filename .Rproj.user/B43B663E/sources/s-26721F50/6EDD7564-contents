## PoliticxsentwitteR 🐦📦 

<img src="https://github.com/guadag12/politicxsentwitteR/raw/main/man/figures/logo.png" width="160px" align="right" />

Paquete que descarga data de Twitter para servidores públicos en Argentina. Es una extensión de [“Politicxs en Twitter Shiny App”](https://oderedes.shinyapps.io/politicosentwitter/). 

  Con las funciones de **get_timeline_data()** y **get_timeline_data_all()** se pueden descargar data de más de 500 politicxs.
  
  Con **get_friends_followers()** y **get_friends_followers_all()** se puede descargar la cantidad de amigos y seguidores para cada usuario en la lista de usuarios por un periodo de tiempo.
  
  Además, con la función **get_network_data()** se pueden descargar quién retweeteó a quién.

<img src="https://github.com/guadag12/politicxsentwitteR/raw/main/man/figures/Net1.html" width="160px" align="right" />


### Instalación 👇:

Al ser un paquete en desarrollo podes utilizar la versión de desarrollo instalando devtools:

``` 
library(devtools)
install_github("guadag12/politicxsentwitteR")
library(politicxsentwitteR)
```

### Funciones:

#### DATA

La mejor parte del paquete es que no requiere autenticación de la API de Twitter. Por lo tanto, podes descargar de manera simple información para los politicxs en Argentina (cuya lista podes buscar [acá](https://github.com/Guadag12/polentw/raw/master1/data/data_politicos.rda)) ó podes realizarlo corriendo el siguiente comando en R y acceder a la lista:

``` 
politicxs_data
```

#### TIMELINES 🤳👇

Podes obtener el timeline -con tweets y retweets- de cualquier funcionario utilizando la función **get_timeline_data**:

``` 
timeline <- get_timeline_data(screen.name = "alferdez")
```

O incluso traerlo para un grupo de usuarios que pertenezcan a una misma categoria ('all','deputies','national executive','others','province servants', 'senators') con la función **get_timeline_data_all**:

``` 
timelines_others_senators <- get_timeline_data_all(category = c('others','senators'))
```

#### FRIENDS & FOLLOWERS 👥

Podes saber cuántos seguidores o amigos gana o pierde un usuario por día:

``` 
friends_followers_SM <- get_friends_followers(screen.name = "SergioMassa")
```

Y también podes conocerlo para un grupo de usuarios según la categoria a la cual pertenecen ('all','deputies','national executive','others','province servants', 'senators') con **get_friends_followers_all**.

```
friends_followers_prov_national <- get_friends_followers_all(category = c('province servants','national executive' ))
```

Esta data puede ser histórica o puede ser diaria. Por default, es histórica.


#### NETWORK

Obtener quién retweeteó a quién en un periodo de tiempo:

```
network <- get_network_data(category= "all", start_date= "2021-01-01", end_date = "2021-03-31")
```

Para esto, tenes que seleccionar la categoria que queres y la fecha de inicio y fin de rtweets.

### Shiny APP: [Politicos en Twitter](https://oderedes.shinyapps.io/politicosentwitter/) 🔷

Recordá que este paquete surge como una posibilidad de descargar data reutilizable en ["Politicians on Twitter"](https://oderedes.shinyapps.io/politicosentwitter/). Este es un proyecto colaborativo entre ["Observatorio de redes"](https://twitter.com/O_de_R), ["Democracia en Red"](https://twitter.com/fundacionDER) y ["National democratic Institute"](https://twitter.com/NDI) con el objetivo de incrementar y mejorar la producción de conocimiento sobre candidatos, social media y desinformación 🙌

## Contactanos ❤️

Si encontras un error, por favor realizá un _issue_! Sentite libre de escribirme con dudas a mi email (guadag12@outlook.com) o enviame un DM en twitter [@guadag12](https://twitter.com/guadag12) 


