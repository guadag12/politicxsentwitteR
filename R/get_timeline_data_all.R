#' Download the timeline data for a group of users
#'
#' This download most of the tweets write by this politician on Twitter
#'
#' @param category  A character with the category selected -"deputies","senators","national executive","others","province servants", 'candidates',  "all"-
#' @param delay  A number of seconds from the download of one user to another
#'
#' @importFrom dplyr bind_rows
#' @import readr
#' @import crayon
#' @export
#' @examples
#' get_timeline_data_all(category = "national executive", delay = 1)
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

get_timeline_data_all <- function(category = "all", delay = 1){

  if(!category %in% c('all','deputies','national executive','others',
                      'province servants', 'senators', 'candidates')){
    stop("the selected category doesn't exist. Trying choose between some of this: 'all',
         'deputies','national executive','others','province servants', 'senators', 'candidates'. ")}
  else{

  # Initialize data frame
  data <- data.frame()

  # Download list of Twitter accounts
  data_politicxs <- download_list()


  # Initialize temporary environment
  tmp_env <- new.env()

  # Iterate over Twitter accounts
  for(i in unique(data_politicxs[data_politicxs$category_ %in% category, "screen_name"])){


    # Initialize temporary environment
    tmp_env <- new.env()
    # Get URL for timeline data
    githubURL <- unique(data_politicxs[data_politicxs$screen_name == i, "url_path"])

    # Download timeline data with delay
    Sys.sleep(delay)
    data_timeline <- tryCatch(readRDS(url(description = paste0(githubURL), method = "libcurl"), tmp_env),
                              error = function(e) {
                                cat("An error occurred on iteration", i, "with the following message:", conditionMessage(e), "\n")
                                return(NULL)
                              }, warning = function(w) {
                                cat("A warning occurred on iteration", i, "with the following message:", conditionMessage(w), "\n")
                                return(NULL)
                              })

    # Check if data was downloaded successfully
    if(!is.null(data_timeline)){

      # Convert data to data frame
      data_timeline <- data.frame(lapply(data_timeline, as.character), stringsAsFactors = FALSE)

      # Append data to data frame
      data <- dplyr::bind_rows(data, data_timeline)

      # Close connections
      rm(list = ls(tmp_env), envir = tmp_env)
    }
  }

  # Return data frame
  return(data)

  cat( crayon::green$bold("Congrats, the data of", category, "is download \n") )

  }
}
