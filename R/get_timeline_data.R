get_timeline_data <-
function(screen.name){

  url_path <- download_url(1)
  data_politicxs <- download_list()

  j = 1

  data <- data.frame("user_id"=c(NA), "status_id"=c(NA), "created_at"=c(NA), "screen_name"=c(NA),
                     "text"=c(NA),"source"=c(NA), "is_quote"=c(NA), "is_retweet"=c(NA), "favorite_count"=c(NA),
                     "retweet_count"=c(NA), "lang"=c(NA), "status_url"=c(NA), "name"=c(NA), "mentions_user_id"=c(NA),
                     "mentions_screen_name"=c(NA), "retweet_status_id"=c(NA), "retweet_text"=c(NA), "retweet_created_at"=c(NA),
                     "retweet_source"=c(NA), "retweet_favorite_count"=c(NA), "retweet_retweet_count"=c(NA), "retweet_user_id"=c(NA), "retweet_screen_name"=c(NA),
                     "retweet_name"=c(NA), "retweet_followers_count"=c(NA),
                     "retweet_friends_count"=c(NA), "retweet_statuses_count"=c(NA), "retweet_location"=c(NA), "retweet_description"=c(NA),
                     "retweet_verified"=c(NA), "reply_to_status_id"=c(NA), "reply_to_user_id"=c(NA), "reply_to_screen_name"=c(NA), "urls_url"=c(NA),
                     "urls_t_co"=c(NA))

  if(length(screen.name) == 1){

    if(!screen.name %in% data_politicxs$screen_name ){
      stop("screen name is not in the list. You must try download with rtweet package")
    }
    my_query_2 <- mongolite::mongo(collection = screen.name,
                                   db = paste0(data_politicxs[data_politicxs$screen_name == screen.name, 'database']),
                                   url = paste0(data_politicxs[data_politicxs$screen_name == screen.name, 'url_path']),
                                   verbose = TRUE)
    data <- suppressMessages(my_query_2$find(query = '{}'))
    return(data)

  }
  else{
    for(i in screen.name){
      if(i %in% data_politicxs$screen_name ){
        my_query_2 <- mongolite::mongo(collection = i,
                                       db = paste0(data_politicxs[data_politicxs$screen_name == i, 'database']),
                                       url = paste0(data_politicxs[data_politicxs$screen_name == i, 'url_path']),
                                       verbose = TRUE)
        data_timeline <- my_query_2$find(query = '{}')
        data <- dplyr::bind_rows(data, data_timeline)
        return(data)
      }
      else{
        print("There's an screen name that is not in the list. You must try download ", i," with rtweet package")
      }
      }

    }

  cat(crayon::green$bold("Congrats, the data of", screen.name, "is download"))
}
