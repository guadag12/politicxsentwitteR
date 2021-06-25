#' Download the friends and followers in a period of time by category
#'
#' This download a time series with the evolution of friends, followers, listed, statuses, likes
#' and the created date of the account with the possibility of download the historic data by category
#'
#' @param category  A character with the category selected -"deputies","senators","national executive","others","province servants",  "all"-
#' @param country   A character with the Alpha 2 code of the country that wants to download
#' @param historic   A logical value. Would you prefer the historic data?
#' @import mongolite
#' @export
#' @examples
#' get_friends_followers_all(category = 'others',  historic = TRUE)
#'
#' @return This function returns a \code{data.frame} including columns:
#' \itemize{
#' \item date
#' \item followers_count
#' \item friends_count
#' \item listed_count
#' \item statuses_count
#' \item favourites_count
#' \item account_created_at
#' }
#'
#' @export
#' @seealso get_friends_followers


get_friends_followers_all <- function(category="all", country="ar", historic = F){

  url_path <- download_url(1)
  data_politicxs <- download_list()

  if(!is.character(category) ) { stop("category must be character") }

  #si es all & arg

  if(category == "all" & country == "ar" & historic == F ){

    #si no es historico
    if(!category %in% data_politicxs$category ){
      stop(paste0("the selected category doesn't exist. Trying choose between some of this:
                                                   'all','deputies','national executive','others','province servants', 'senators'. "))
    }
    else{
    data_crec_db <- mongolite::mongo(collection = "data_crec", # Data Table
                                     db = "CREC_db", # DataBase
                                     url = url_path,
                                     verbose = TRUE)
    data <- data_crec_db$find(paste0('{"date" : ','"', Sys.Date(), '"','}') )}
  }

  #si es historico
  if(category == "all" & country == "ar" & historic == T ){
    if(!category %in% data_politicxs$category ){
      stop(paste0("the selected category doesn't exist. Trying choose between some of this:
                                                   'all','deputies','national executive','others','province servants', 'senators'. "))
    }
    else{
    data_crec_db <- mongolite::mongo(collection = "data_crec", # Data Table
                                     db = "CREC_db", # DataBase
                                     url = url_path,
                                     verbose = TRUE)
    data <- data_crec_db$find()}
  }

  if((category != "all" | country != "ar" ) & historic == F){
    if(!category %in% data_politicxs$category ){
      stop(paste0("the selected category doesn't exist. Trying choose between some of this:
                                                   'all','deputies','national executive','others','province servants', 'senators'. "))
    }
    else{
    data_crec_db <- mongolite::mongo(collection = "data_crec",
                                     db = "CREC_db",
                                     url = url_path,
                                     verbose = TRUE)
    data <- data_crec_db$find(paste0('{"date" : ','"', Sys.Date(), '"','}') )
    data <- data[(data$screen_name %in% data_politicxs[(data_politicxs$category == category),
                                                       "screen_name"]), ]}

  }

  if((category != "all" | country != "ar" ) & historic == T){
    if(!category %in% data_politicxs$category ){
      stop(paste0("the selected category doesn't exist. Trying choose between some of this:
                                                   'all','deputies','national executive','others','province servants', 'senators'. "))
    }
    else{

    data_crec_db <- mongolite::mongo(collection = "data_crec", # Data Table
                                     db = "CREC_db", # DataBase
                                     url = url_path,
                                     verbose = TRUE)
    data <- data_crec_db$find()
    data <- data[(data$screen_name %in% data_politicxs[(data_politicxs$category == category), "screen_name"]), ] }
}
  data <- data[, c("date", "screen_name", "followers_count", "friends_count", "listed_count", "statuses_count",
                   "favourites_count")]
  return(data)
  cat(crayon::green$bold("Congrats, the data of", category, "is download"))
}
