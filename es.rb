require 'elasticsearch'
require 'elasticsearch/dsl'
include Elasticsearch::DSL

module ES
  class ES
    def initialize
      @client = Elasticsearch::Client.new
      @indices = []
    end

    def client
      @client
    end

    # Returns Enumerator
    def collect_layers(prefix = '*', suffix = '*')
      @client.indices.get_aliases(index: "#{prefix}-#{suffix}")
    end

    def map_indices
      collect_layers.keys.map{ |k| @indices << k }
      @indices
    end

    def destroy_all_indices
      client.indices.delete index: map_indices
    end

    def build_indices(index)
      client.indices.create index: index,
                        body: {
                          settings: {
                            index: {
                              number_of_shards: 5,
                              number_of_replicas: 1
                            }
                          }
                        }
    end

    def build_mappings(index)

    end

    def build_backup_index_files(index)

    end

    def query(index, term, from = 0, size = 25)
      response = @client.search(
        index: index.to_s,
        body: {
          query: {
            multi_match: {
              query: term,
              fields: ["properties.Street", "properties.Street Alias", "properties.Left Community"]
            }
          },
          from: from,
          size: size
        })

      results = response['hits']['hits'].map{ |i| i['_source']['properties'] }
      results
    end
  end
end
