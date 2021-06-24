#' Download the data of who's retweets who's
#'
#' This function download all the retweets that every user on the list of politician on twitter made with each others
#'
#' @param category A character vector with the category selected -"deputies","senators","national executive","others","province servants",  "all"-
#' @param start_date   A character with the date where the retweets ocurr. This param read the date info in format 'yyyy-mm-dd'
#' @param end_date   A character with the date where the retweets stop. This param read the date info in format 'yyyy-mm-dd'
#' @import mongolite
#' @export
#' @examples
#' get_network_data(category = 'province servants',  start_date= "2020-10-01", end_date = "2020-12-31")
#' get_network_data(category = c('province servants', 'others'),  start_date= "2020-10-01", end_date = "2020-12-31")
#'
get_network_data <-
function(category= "all", start_date= "2021-01-01", end_date = "2021-03-31"){
    if(length(category)==1){
      if(!category %in% c('all','deputies','national executive','others','province servants', 'senators')){stop("the selected category doesn't exist. Trying choose between some of this: 'all','deputies','national executive','others','province servants', 'senators'. ")}

      url_path_5 <- download_url(5)
      data_politicxs <- download_list()

      my_data_2 <- mongolite::mongo(collection = "data_network_mensual", # Data Table
                                    db = "data_net", # DataBase
                                    url = url_path_5,
                                    verbose = TRUE)
      data_net <- my_data_2$find('{}')
      data_net <-data_net[((data_net$month_year >= start_date) &
                             (data_net$month_year <= end_date)) &
                            ((data_net$user_id %in% data_politicxs[data_politicxs$category %in% category, "user_id"]) &
                               (data_net$retweet_user_id %in% data_politicxs[data_politicxs$category %in% category, "user_id"])),]
      data_net$month_year <- as.Date(data_net$month_year)
      data_net <- data_net[,c("month_year", "user_id", "retweet_user_id", "value")]
      return(data_net)
    }
    else{
      for(i in category){
        if(!i %in% c('all','deputies','national executive','others','province servants', 'senators')){message(paste0(i:"the selected category doesn't exist. Trying choose between some of this: 'all','deputies','national executive','others','province servants', 'senators'. "))}
      }
      url_path_5 <- download_url(5)
      data_politicxs <- download_list()

      my_data_2 <- mongolite::mongo(collection = "data_network_mensual", # Data Table
                                    db = "data_net", # DataBase
                                    url = url_path_5,
                                    verbose = TRUE)
      data_net <- my_data_2$find('{}')
      data_net <-data_net[((data_net$month_year >= start_date) &
                             (data_net$month_year <= end_date)) &
                            ((data_net$user_id %in% data_politicxs[data_politicxs$category %in% category, "user_id"]) &
                               (data_net$retweet_user_id %in% data_politicxs[data_politicxs$category %in% category, "user_id"])),]
      data_net$month_year <- as.Date(data_net$month_year)
      data_net <- data_net[,c("month_year", "user_id", "retweet_user_id", "value")]
      return(data_net)}
  }
