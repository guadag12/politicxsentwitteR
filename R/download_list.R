#' Get the list of politicians on twitter
#'
#' Download from mongolite the dataframe
#'
#' @import readr

download_list <-
  function(){
    options(scipen =999)
    data_politicxs <- read_csv("https://raw.githubusercontent.com/guadag12/configuration_db/main/lista_politicos_politicxsentwitteR.csv",
                               locale = locale(encoding = "ISO-8859-1"))
    data_politicxs <- data.frame(lapply(data_politicxs, as.character), stringsAsFactors=FALSE)
    return(data_politicxs)
  }
