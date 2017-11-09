Rails.application.routes.draw do

    # API JSON data endpoints for use by other services, including this app's HTML-rendering controllers
    scope :api do
        scope :v1 do
            scope :data do
                scope :cat do
                    get '/health', to: 'data#health_data'
                    get '/state', to: 'data#state_data'
                    get '/indices', to: 'data#indices_data'
                    get '/aliases', to: 'data#aliases_data'
                    get '/shards', to: 'data#shards_data'
                    get '/segments', to: 'data#segments_data'
                    get '/fielddata', to: 'data#fielddata_data'
                    get '/recovery', to: 'data#recovery_data'
                end # /cat scope

                scope :node do
                    get '/stats/all', to: 'data#node_stats_data'
                    get '/stats/name/:name', to: 'data#node_stats_data'
                    get '/stats/group/:group', to: 'data#node_stats_group_data'
                    get '/stats/name/:name/group/:group', to: 'data#node_stats_group_data'
                    get '/names', to: 'data#node_names_data'
                    get '/hot_threads', to: 'data#hot_threads_data'
                    get '/hot_threads/count/:count', to: 'data#hot_threads_data'
                end # /node scope
            end # /data scope
        end # /v1 scope
    end # /api scope

    # TODOs:
    # - add setter for default ES cluster instead of "localhost:9200"

end
