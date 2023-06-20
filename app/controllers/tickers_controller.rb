class TickersController < ApplicationController
  def search
    @tickers = Ticker.search(params[:q])
    render json: @tickers.results.pluck(:_source)
  end
end
