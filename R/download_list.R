#' Get the list of politicians on twitter
#'
#' Download from mongolite the dataframe
#'
#' @import mongolite
#'

download_list <-
  function(){
    url_path_ = 'mongodb+srv://new_user_db:password_new_123@cluster0.gxwrq.mongodb.net/test' #pen,, config
    data_politicxs_md <- mongolite::mongo(collection = "data_politicxs_package2", # Data Table
                                          db = "configuration_db", # DataBase
                                          url = url_path_,
                                          verbose = TRUE)
    data_politicxs <- data_politicxs_md$find(query = '{}')
    return(data_politicxs)
  }
