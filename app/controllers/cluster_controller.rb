require 'elasticsearch/model'

class ClusterController < ApplicationController
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
		@indices_data = __elasticsearch__.client.cat.indices
		render :json => @indices_data
	end

	def aliases_data
		@aliases_data = __elasticsearch__.client.cat.aliases
		render :json => @aliases_data
	end

	def shards_data
		@shards_data = __elasticsearch__.client.cat.shards
		render :json => @shards_data
	end

end
