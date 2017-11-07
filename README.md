### EsPeek

#### Purpose
This project is just a quick experiment to:
* Learn me some Ruby-on-Rails
* Learn about the Elasticsearch bindings for Ruby
* Learn about the Elasticsearch bindings for Rails, ActiveRecord models etc.

#### Quick Start

1. Install `docker` locally, make sure the Docker Daemon is running locally
2. Run this: `bin/es24_rails_app_session`

^ this starts an ES 2.4 server at `localhost:9200` in a Docker container on your laptop, and launches the rails app. CTRL-C'ing out will kill/clean up the app and the container


#### TODOs
* Add a bunch of endpoints to expose various ES cluster admin data via ES API calls
* HTML pages to render the data in semi-pretty format (using Bootstrap+SASS currently but we'll see how that goes)
* Make a _very_ simplified version of Head/Kopf/Cerebro etc. to play with this stack a bit

