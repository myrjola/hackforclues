library(httr)

install.packages("tidyjson", "dplyr")
library(tidyjson)
library(dplyr)

apiendpoint <- readline(
  prompt="Enter API endpoint (e.g. http://localhost:8000/api/v1/sensordata): ")
secret_token <- readline(prompt="Enter authorization token: ")

r <- GET(apiendpoint,
         add_headers(Authorization = paste("Token ", secret_token)))

## json <- content(r, "text")
# Example of heterogenous JSON.
json <- '
[
    {
        "timestamp": "2016-10-12T07:17:08.563879Z",
        "user": null,
        "payload": {
            "name": "first"
        }
    },
    {
        "timestamp": "2016-10-12T09:28:00.261538Z",
        "user": null,
        "payload": {
            "startAt": 0,
            "maxResults": 15,
            "name": "testing",
            "fields": [
                "summary",
                "status",
                "assignee"
            ]
        }
    },
    {
        "timestamp": "2016-10-15T15:04:14.852936Z",
        "user": 1,
        "payload": "asdf"
    },
    {
        "timestamp": "2016-10-15T15:26:30.201096Z",
        "user": 1,
        "payload": {
            "client": "martinslaptop",
            "accelerometer": {
                "x": -0.1,
                "z": 0.4,
                "y": 2.5
            },
            "gps": [
                102.0,
                1.5
            ]
        }
    },
    {
        "timestamp": "2016-10-15T15:26:34.834101Z",
        "user": 1,
        "payload": {
            "client": "martinslaptop",
            "accelerometer": {
                "x": -0.3,
                "z": 2.4,
                "y": -2.5
            },
            "gps": [
                103.0,
                10.5
            ]
        }
    }
]
'

df <- jsonlite::fromJSON(json, simplifyDataFrame = TRUE)

# The payload is a mess of lists if it's not standardized
df$payload

# tidyjson is good for massaging heterogenous JSON to a tidy data frame

tidydf <- json %>%
  gather_array %>%
  spread_values(timestamp=jstring("timestamp"),
                user=jstring("user"),
                payload=jstring("payload")) %>%
  filter(grepl("accelerometer", payload)) %>%
  enter_object("payload") %>%
  enter_object("accelerometer") %>%
  spread_values(accelerometer.x=jstring("x"),
                accelerometer.y=jstring("y"),
                accelerometer.z=jstring("z")) %>%
  select(timestamp, user, accelerometer.x, accelerometer.y, accelerometer.z)

tidydf$timestamp <- as.POSIXlt(tidydf$timestamp, format="%Y-%m-%dT%H:%M:%S",
                               origin="1970-01-01",tz="GMT")
