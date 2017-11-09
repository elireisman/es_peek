require 'elasticsearch/model'

class DataController < ApiController
	include DataHelper, Elasticsearch::Model

	# _cat and _cluster endpoints

	def health_data
		@health_data = help_health_data
		render :json => @health_data
	end

	def state_data
		@state_data = help_state_data
		render :json => @state_data
	end

	def indices_data
		@indices_data = help_indices_data
		render :json => @indices_data
	end

	def aliases_data
		@aliases_data = help_aliases_data
		render :json => @aliases_data
	end

	def shards_data
		@shards_data = help_shards_data
		render :json => @shards_data
	end

	def segments_data
		@segments_data = help_segments_data
		render :json => @segments_data
	end

	### _nodes endpoints

	def node_stats_group_data
		render(:json => {error: true, msg: 'must provide the name of a valid node stats group'}) unless params[:group]

		@node_stats_data = help_node_stats_group_data
		render :json => @node_stats_data
	end

	# get full list of 
	def node_names_data
		@node_names_data = help_node_names_data
		render :json => @node_names_data
	end

        # list full dump of all node stats groups for all nodes, or for one named node
        # using human-readable name (one of those returned by node_names_data endpoint)
        def node_stats_data
                @node_stats_data = help_node_stats_data
                render :json => @node_stats_data
        end

	# WARNING: does not return JSON data, it's free-form text
	def hot_threads_data
		@hot_threads_data = help_hot_threads_data(params[:count])
		render :html => @hot_threads_data
	end

end
