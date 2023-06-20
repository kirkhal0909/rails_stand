if Rails.env.test?
  class LoopMock
    def respond_to_missing?(_name, _include_private)
      true
    end

    def method_missing(*_args)
      self
    end
  end

  Elasticsearch::Model.client = LoopMock.new
else
  Elasticsearch::Model.client = Elasticsearch::Client.new(
    host: ENV.fetch('HOST_ELASTICSEARCH', 'localhost:9200'),
    transport_options: { ssl: { verify: false } }
  )
end
