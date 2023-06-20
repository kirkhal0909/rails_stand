class Ticker < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :symbol, analyzer: 'english', index_options: 'offsets'
      indexes :name, analyzer: 'russian'
      indexes :name_full, analyzer: 'russian'
      indexes :name_en, analyzer: 'english'
    end
  end

  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query, fuzziness: 'AUTO',
            fields: %w[symbol name name_full name_en]
          }
        }
      }
    )
  end

  enum symbol_type: %i[symbol_shares symbol_index]

  has_many :ticker_values
  validates_uniqueness_of :symbol, allow_blank: false
end

Ticker.__elasticsearch__.client.indices.delete index: Ticker.index_name rescue nil # rubocop:disable Style/RescueModifier
Ticker.__elasticsearch__.client.indices.create index: Ticker.index_name,
                                               body: {
                                                 settings: Ticker.settings.to_hash,
                                                 mappings: Ticker.mappings.to_hash
                                               }

Ticker.import
