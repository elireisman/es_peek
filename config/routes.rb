Rails.application.routes.draw do

    # API JSON data endpoints for use by other services, including this app's HTML-rendering controllers
    scope :api do
        scope :v1 do
            scope :data do
                scope :cat do
                    get '/health', to: 'admin#health_data'
                    get '/state', to: 'admin#state_data'
                    get '/indices', to: 'admin#indices_data'
                    get '/aliases', to: 'admin#aliases_data'
                    get '/shards', to: 'admin#shards_data'
                    get '/segments', to: 'admin#segments_data'
                end # /cat scope

                scope :node do
                    get '/stats/group/:group', to: 'admin#node_stats_group_data'
                    get '/stats/name/:name', to: 'admin#node_stats_data'
                    get '/stats/all', to: 'admin#node_stats_data'
                    get '/names', to: 'admin#node_names_data'
                end # /node scope
            end # /data scope
        end # /v1 scope
    end # /api scope

    # TODOs:
    # - add setter for default ES cluster instead of "localhost:9200"

end
