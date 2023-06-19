module Moex
  class BaseService < ApplicationService
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def rows(table_pos = 0)
      response.dig('document', 'data', table_pos, 'rows', 'row') ||
        response.dig('document', 'data', 'rows', 'row')
    end
  end
end
