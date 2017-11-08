Rails.application.routes.draw do

	# /_cluster /_cat and /_nodes JSON data endpoints (pulled from ES)
	get '/admin/health_data', to: 'admin#health_data'
	get '/admin/state_data', to: 'admin#state_data'
	get '/admin/indices_data', to: 'admin#indices_data'
	get '/admin/aliases_data', to: 'admin#aliases_data'
	get '/admin/shards_data', to: 'admin#shards_data'
	get '/admin/segments_data', to: 'admin#segments_data'
	get '/admin/node/stats_data/group/:group', to: 'admin#node_stats_group_data'
	get '/admin/node/stats_data/name/:name', to: 'admin#node_stats_data'
	get '/admin/node/stats_data/all', to: 'admin#node_stats_data'
	get '/admin/node/names_data', to: 'admin#node_names_data'

	# TODOs:
	# (1) add setter for default ES cluster instead of "localhost:9200"
	# (2) add params to endpoints to narrow down data returned in GETs

end
