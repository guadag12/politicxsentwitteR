#' Download the timeline data for a single user
#'
#' This download most of the tweets write by this politician on Twitter
#'
#' @param screen.name  A character with the screen name of the account
#' @import mongolite
#' @importFrom dplyr bind_rows
#' @export
#' @examples
#' get_timeline_data(screen.name = "alferdez")
#'
#' @return This function returns a \code{data.frame} including columns:
#' \itemize{
#' \item user_id
#' \item status_id
#' \item created_at
#' \item screen_name
#' \item text
#' \item source
#' \item is_quote
#' \item is_retweet
#' \item favorite_count
#' \item retweet_count
#' \item lang
#' \item status_url
#' \item name
#' \item mentions_user_id
#' \item mentions_screen_name
#' \item retweet_status_id
#' \item retweet_text
#' \item retweet_created_at
#' \item retweet_source
#' \item retweet_favorite_count
#' \item retweet_retweet_count
#' \item retweet_user_id
#' \item retweet_screen_name
#' \item retweet_name
#' \item retweet_followers_count
#' \item retweet_friends_count
#' \item retweet_statuses_count
#' \item retweet_location
#' \item retweet_description
#' \item retweet_verified
#' \item reply_to_user_id
#' \item reply_to_screen_name
#' \item urls_url
#' \item urls_t_co
#' }
#'
#' @export
#' @seealso \link[rtweet]{search_tweets}
#'


get_timeline_data <- function(screen.name){

  url_path <- download_url(1)
  data_politicxs <- download_list()

  j = 1

  if(length(screen.name) == 1){
    if(!screen.name %in% data_politicxs$screen_name ){
      stop("screen name is not in the list. You must try download with rtweet package")
    }
    else{
    my_query_2 <- mongolite::mongo(collection = screen.name,
                                   db = paste0(data_politicxs[data_politicxs$screen_name == screen.name, 'database']),
                                   url = paste0(data_politicxs[data_politicxs$screen_name == screen.name, 'url_path']),
                                   verbose = TRUE)
    data <- my_query_2$find(query = '{}')
    return(data)
    }

  }
  else{

    for(i in screen.name){
      if(!i %in% data_politicxs$screen_name ){
        warning(paste0(i,"is not in the list on politicians on twitter. You must try download with rtweet package"))
      }
      else{
        my_query_2 <- mongolite::mongo(collection = i,
                                       db = paste0(data_politicxs[data_politicxs$screen_name == i, 'database']),
                                       url = paste0(data_politicxs[data_politicxs$screen_name == i, 'url_path']),
                                       verbose = TRUE)
        data_timeline <- my_query_2$find(query = '{}')

        if(j == 1){
          data <- data_timeline[0,]
          data <- dplyr::bind_rows(data, data_timeline)
          j = j+1
        }
        else{
          data <- dplyr::bind_rows(data, data_timeline)
          j = j+1
          }
      }
    }
    return(data)

  }

  cat(crayon::green$bold("Congrats, the data of", screen.name, "is download ✨"))
}
