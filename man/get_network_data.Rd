% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_network_data.R
\name{get_network_data}
\alias{get_network_data}
\title{Download the data of who's retweets who's}
\usage{
get_network_data(
  category = "all",
  start_date = "2021-01-01",
  end_date = "2021-03-31"
)
}
\arguments{
\item{category}{A character vector with the category selected -"deputies","senators","national executive","others","province servants", 'candidates',  "all"-}

\item{start_date}{A character with the date where the retweets ocurr. This param read the date info in format 'yyyy-mm-dd'}

\item{end_date}{A character with the date where the retweets stop. This param read the date info in format 'yyyy-mm-dd'}
}
\description{
This function download all the retweets that every user on the list of politician on twitter made with each others
}
\examples{
get_network_data(category = 'province servants',  start_date= "2020-10-01", end_date = "2020-12-31")

}
