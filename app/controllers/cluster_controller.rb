require 'elasticsearch/model'

class ClusterController < ApplicationController
	include Elasticsearch::Model

	# TODO: mappings, settings etc.

	def health_data
		@health_data = __elasticsearch__.client.cluster.health
	end

	def health
		# render /_cluster/health data in HTML page
	end

end
