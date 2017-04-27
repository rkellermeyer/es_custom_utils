require 'elasticsearch'
require 'elasticsearch/dsl'
include Elasticsearch::DSL

class BuildLocalData
  client = Elasticsearch::Client.new log: true
  client.indices.get_aliases(index: '*-*').map { |al|  puts al[0] }
end
