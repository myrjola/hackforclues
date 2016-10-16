library(httr)

install.packages("tidyjson", "dplyr")
library(tidyjson)
library(dplyr)

apiendpoint <- readline(
  prompt="Enter API endpoint (e.g. http://localhost:8000/api/v1/sensordata): ")
secret_token <- readline(prompt="Enter authorization token: ")

r <- GET(apiendpoint,
         add_headers(Authorization = paste("Token ", secret_token)))

df <- jsonlite::fromJSON(content(r, "text"), simplifyDataFrame = TRUE)

df$payload

# tidyjson is good for massaging heterogenous JSON to a tidy data frame

json <- content(r, "text")
## json <- "[{\"timestamp\":\"2016-10-12T07:17:08.563879Z\",\"user\":null,\"payload\":{\"name\":\"first\"}},{\"timestamp\":\"2016-10-12T07:25:36.308921Z\",\"user\":null,\"payload\":{\"startAt\":0,\"maxResults\":15,\"name\":\"testing\",\"fields\":[\"summary\",\"status\",\"assignee\"]}},{\"timestamp\":\"2016-10-12T09:28:00.261538Z\",\"user\":null,\"payload\":{\"startAt\":0,\"maxResults\":15,\"name\":\"testing\",\"fields\":[\"summary\",\"status\",\"assignee\"]}},{\"timestamp\":\"2016-10-15T14:33:03.161461Z\",\"user\":null,\"payload\":\"{                 \\\"fields\\\": [                     \\\"summary\\\",                     \\\"status\\\",                     \\\"assignee\\\"                 ],                 \\\"startAt\\\": 0,                 \\\"name\\\": \\\"testing\\\",                 \\\"maxResults\\\": 15             }\"},{\"timestamp\":\"2016-10-15T14:35:24.040599Z\",\"user\":null,\"payload\":\"asdf,we,;ewef\"},{\"timestamp\":\"2016-10-15T14:35:34.334402Z\",\"user\":null,\"payload\":\"asdf,we,;ewef\\\"\\\"\"},{\"timestamp\":\"2016-10-15T15:04:14.852936Z\",\"user\":1,\"payload\":\"asdf\"},{\"timestamp\":\"2016-10-15T15:26:30.201096Z\",\"user\":1,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:26:34.834101Z\",\"user\":1,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:26:49.153148Z\",\"user\":1,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:26:52.787866Z\",\"user\":1,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:26:53.669879Z\",\"user\":1,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:26:54.317840Z\",\"user\":1,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:26:54.935753Z\",\"user\":1,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:26:55.800774Z\",\"user\":1,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:26:56.703422Z\",\"user\":1,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:26:57.568765Z\",\"user\":1,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:44:57.395391Z\",\"user\":2,\"payload\":[1,2]},{\"timestamp\":\"2016-10-15T15:45:12.834850Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:45:18.448989Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:45:19.414527Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:45:20.064941Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:48:32.701367Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:48:34.008399Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:48:34.822827Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:48:36.289184Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:48:37.109254Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:49:00.851007Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:49:01.978372Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:49:02.325002Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:49:02.592067Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:49:02.826097Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:49:03.074880Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:49:03.329457Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:49:03.580922Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:49:03.845295Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:49:04.126405Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:49:04.394322Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:49:04.645996Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:49:04.909450Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}},{\"timestamp\":\"2016-10-15T15:49:05.176943Z\",\"user\":2,\"payload\":{\"client\":\"martinslaptop\",\"accelerometer\":{\"x\":-0.1,\"z\":0.4,\"y\":2.5},\"gps\":[102.0,1.5]}}]"

tidydf <- json %>%
  gather_array %>%
  spread_values(timestamp = jstring("timestamp"),
                user = jstring("user"),
                payload = jstring("payload")) %>%
  filter(grepl("accelerometer", payload)) %>%
  enter_object("payload") %>%
  enter_object("accelerometer") %>%
  spread_values(accelerometer.x=jstring("x"),
                accelerometer.y=jstring("y"),
                accelerometer.z=jstring("z")) %>%
  select(timestamp, user, accelerometer.x, accelerometer.y, accelerometer.z)
