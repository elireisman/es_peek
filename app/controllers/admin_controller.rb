require 'elasticsearch/model'

class AdminController < ApiController
	include Elasticsearch::Model

	# TODO: for actual types stored in indices, controllers will need mappings/settings/analyzer blocks etc.

	def health_data
		@health_data = __elasticsearch__.client.cluster.health
		render :json => @health_data
	end

	def state_data
		@state_data = __elasticsearch__.client.cluster.state
		render :json => @state_data
	end

	def indices_data
		@indices_data = __elasticsearch__.client.cat.indices(:format => 'json')
		render :json => @indices_data
	end

	def aliases_data
		@aliases_data = __elasticsearch__.client.cat.aliases(:format => 'json')
		render :json => @aliases_data
	end

	def shards_data
		@shards_data = __elasticsearch__.client.cat.shards(:format => 'json')
		render :json => @shards_data
	end

	def segments_data
		@segments_data = __elasticsearch__.client.cat.segments(:format => 'json')
		render :json => @segments_data
	end

	def node_stats_group_data
		render(:json => {error: true, msg: 'must provide stats group name'}) unless params[:group]

		results = __elasticsearch__.client.nodes.stats(:format => 'json')
		@node_stats_data = results['nodes'].keys.map do |k|
			{k => results['nodes'][k].select do |gk, gv|
				gv if gk == params[:group]
			end}
		end

		render :json => @node_stats_data
	end

	# get full list of 
	def node_names_data
		@node_names_data = __elasticsearch__.client.cat.nodes(:format => 'json', :h => 'name')
		render :json => @node_names_data
	end

	# list full dump of all node stats groups for all nodes, or for one named node
	# using human-readable name (one of those returned by node_names_data endpoint)
	def node_stats_data
		@node_stats_data = __elasticsearch__.client.nodes.stats(:format => 'json')

		if params[:name]
			filtered_ns = @node_stats_data['nodes'].keys.map do |k|
				[ k, @node_stats_data['nodes'][k] ] if @node_stats_data['nodes'][k]['name'] == params[:name]
			end.to_h
			@node_stats_data['nodes'] = filtered_ns
		end

		render :json => @node_stats_data
	end

end
