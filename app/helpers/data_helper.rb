require 'elasticsearch/model'

module DataHelper
	include Elasticsearch::Model

	# _cat and _cluster endpoints

	def help_health_data
		__elasticsearch__.client.cluster.health
	end

	def help_state_data
		__elasticsearch__.client.cluster.state
	end

	def help_indices_data
		__elasticsearch__.client.cat.indices(:format => 'json')
	end

	def help_aliases_data
		__elasticsearch__.client.cat.aliases(:format => 'json')
	end

	def help_shards_data
		__elasticsearch__.client.cat.shards(:format => 'json')
	end

	def help_segments_data
		__elasticsearch__.client.cat.segments(:format => 'json')
	end

	### _nodes endpoints

	def help_node_stats_group_data(group, name = nil)
		__elasticsearch__.client.nodes.stats(:format => 'json')['nodes'].keys.map do |k|
			node_name = results['nodes'][k]['name']
			if !name || name == node_name
				{ k => results['nodes'][k].select {|gk, gv| gv if group == gk} }
			end
		end
	end

	# get full list of 
	def help_node_names_data
		__elasticsearch__.client.cat.nodes(:format => 'json', :h => 'name')
	end

        # list full dump of all node stats groups for all nodes, or for one named node
        # using human-readable name (one of those returned by node_names_data endpoint)
        def help_node_stats_data(name = nil)
                ns = __elasticsearch__.client.nodes.stats(:format => 'json')
                if name
                        filtered_ns = ns['nodes'].keys.map do |k|
                                [ k, ns['nodes'][k] ] if ns['nodes'][k]['name'] == name
                        end.to_h
                        ns['nodes'] = filtered_ns
                end

		ns
        end

	# WARNING: this isn't JSON-formatable, it's raw text for some reason
	def help_hot_threads_data(count = 5)
		__elasticsearch__.client.nodes.hot_threads(:threads => count)
	end

end
