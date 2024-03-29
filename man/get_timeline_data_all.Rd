% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_timeline_data_all.R
\name{get_timeline_data_all}
\alias{get_timeline_data_all}
\title{Download the timeline data for a group of users}
\usage{
get_timeline_data_all(category = "all", delay = 1)
}
\arguments{
\item{category}{A character with the category selected -"deputies","senators","national executive","others","province servants", 'candidates',  "all"-}

\item{delay}{A number of seconds from the download of one user to another}
}
\value{
This function returns a \code{data.frame} including columns:
\itemize{
\item user_id
\item status_id
\item created_at
\item screen_name
\item text
\item source
\item is_quote
\item is_retweet
\item favorite_count
\item retweet_count
\item lang
\item status_url
\item name
\item mentions_user_id
\item mentions_screen_name
\item retweet_status_id
\item retweet_text
\item retweet_created_at
\item retweet_source
\item retweet_favorite_count
\item retweet_retweet_count
\item retweet_user_id
\item retweet_screen_name
\item retweet_name
\item retweet_followers_count
\item retweet_friends_count
\item retweet_statuses_count
\item retweet_location
\item retweet_description
\item retweet_verified
\item reply_to_user_id
\item reply_to_screen_name
\item urls_url
\item urls_t_co
}
}
\description{
This download most of the tweets write by this politician on Twitter
}
\examples{
get_timeline_data_all(category = "national executive", delay = 1)

}
\seealso{
\link[rtweet]{search_tweets}
}
