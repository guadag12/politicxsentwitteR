#' Download the data of who's retweets who's
#'
#' This function download all the retweets that every user on the list of politician on twitter made with each others
#'
#' @param category A character vector with the category selected -"deputies","senators","national executive","others","province servants", 'candidates',  "all"-
#' @param start_date   A character with the date where the retweets ocurr. This param read the date info in format 'yyyy-mm-dd'
#' @param end_date   A character with the date where the retweets stop. This param read the date info in format 'yyyy-mm-dd'
#' @import readr
#' @import crayon
#' @export
#' @examples
#' get_network_data(category = 'province servants',  start_date= "2020-10-01", end_date = "2020-12-31")
#'


get_network_data <- function(category= "all", start_date= "2021-01-01", end_date = "2021-03-31"){

  if(!category %in% c('all','deputies','national executive','others','province servants', 'senators', 'candidates')){stop("the selected category doesn't exist. Trying choose between some of this: 'all','deputies','national executive','others','province servants', 'senators', 'candidates'. ")}
  else{
    data_politicxs <- download_list()
    data_politicxs$user_id <- as.character(data_politicxs$user_id)


    githubURL = "https://github.com/guadag12/data_network/raw/main/complete_dataset_.rds"
    data_net <- readRDS(url(description = paste0(githubURL), method="libcurl"))
    data_net <- data_net[((data_net$created_at >= start_date) & (data_net$created_at <= end_date)) &
                           (data_net$user_id %in%  data_politicxs[data_politicxs$category_ == category, "user_id"]) &
                           (data_net$retweet_user_id %in%  data_politicxs[data_politicxs$category_ == category, "user_id"]) , ]

    data_net <- data_net[,c("created_at", "user_id", "retweet_user_id", "value")]
  }
  return(data_net)

}

