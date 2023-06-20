Elasticsearch::Model.client = Elasticsearch::Client.new(host: ENV.fetch('HOST_ELASTICSEARCH', 'localhost:9200'))
