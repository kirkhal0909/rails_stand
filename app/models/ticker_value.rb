class TickerValue < ApplicationRecord
  belongs_to :ticker
  validates :ticker_id, uniqueness: { scope: :date }
end
