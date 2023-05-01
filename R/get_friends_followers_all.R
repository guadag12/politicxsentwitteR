#' Download the friends and followers in a period of time by category
#'
#' This download a time series with the evolution of friends, followers, listed, statuses, likes
#' and the created date of the account with the possibility of download the historic data by category
#'
#' @param category  A character with the category selected -"deputies","senators","national executive","others","province servants", 'candidates',  "all"-
#' @import readr
#' @import crayon
#' @export
#' @examples
#' get_friends_followers_all(category = 'others')
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



get_friends_followers_all <- function(category="all"){

  data_politicxs <- download_list()

  if(!is.character(category) ) { stop("category must be character") }

  #si es all & arg

  if(category == "all"){

    #si no es historico
    if(!category %in% data_politicxs$category_ ){
      stop(paste0("the selected category doesn't exist. Trying choose between some of this:
                  'all','deputies','national executive','others','province servants', 'senators', 'candidates'. (1) "))
    }
    else{
      data <- read_csv("https://github.com/guadag12/configuration_db/raw/main/amount_followers.csv",
                            locale = locale(encoding = "Latin1"))
      data <- data.frame(lapply(data, as.character), stringsAsFactors=FALSE)

    }
  }

  if(category != "all"){
    if(!category %in% data_politicxs$category_ ){
      stop(paste0("the selected category doesn't exist. Trying choose between some of this:
                                                   'all','deputies','national executive','others',
                  'province servants', 'senators', 'candidates'. (2)"))
    }
    else{

    data_crec <- read_csv("https://github.com/guadag12/configuration_db/raw/main/amount_followers.csv",
                            locale = locale(encoding = "Latin1"))
    data_crec <- data.frame(lapply(data_crec, as.character), stringsAsFactors=FALSE)
    data_politicxs_filter <- subset(data_politicxs, category_ == category)
    data <- data_crec[data_crec$screen_name %in% unique(data_politicxs_filter$screen_name), ]
    }

  }

  data <- data[,  c("screen_name","date", "followers_count", "friends_count",
                    "listed_count", "statuses_count", "favourites_count")]

  return(data)
  cat(crayon::green$bold("Congrats, the data of", category, "is download"))
}

