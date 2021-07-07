#' Get the url correspondent
#'
#' With the right url we could access to the dataset storage
#'
#' @param x A number that describe the number of url path necessary
#'
#'
#'

download_url <- function(x){
  url_path = 'mongodb+srv://new_user_db:password_new@cluster0.gxwrq.mongodb.net/test' #pen,, config
  url_path_2 = 'mongodb+srv://new_user_db:password_new@cluster0.1b8mt.mongodb.net/test' # hcdn
  url_path_3 = 'mongodb+srv://new_user_db:password_new@cluster0.j59fq.mongodb.net/test' # hcsm
  url_path_4 = 'mongodb+srv://new_user_db:password_new@cluster0.mh1ca.mongodb.net/test' #otros, prov
  url_path_5 = 'mongodb+srv://new_user_db:password_new@cluster0.bwilj.mongodb.net/test' # data net + data colors
  if(x==1){return(url_path)}
  if(x==2){return(url_path_2)}
  if(x==3){return(url_path_3)}
  if(x==4){return(url_path_4)}
  if(x==5){return(url_path_5)}
}
