Rails.application.routes.draw do

	# /_cluster and /_nodes JSON data endpoints (pulled from ES)
	get '/cluster/health_data', to: 'cluster#health_data'
	get '/cluster/state_data', to: 'cluster#state_data'
	get '/cluster/indices_data', to: 'cluster#indices_data'
	get '/cluster/aliases_data', to: 'cluster#aliases_data'
	get '/cluster/shards_data', to: 'cluster#shards_data'

end
