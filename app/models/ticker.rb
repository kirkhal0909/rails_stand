class Ticker < ApplicationRecord
  enum symbol_type: %i[symbol_shares symbol_index]

  has_many :ticker_values
  validates_uniqueness_of :symbol, allow_blank: false
end
