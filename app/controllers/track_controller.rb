class TrackController < ApplicationController
  def track
    if params[:id].to_i == 1
      1 / 0
    else
      begin
        1 / 0
      rescue ZeroDivisionError => e
        Raven.capture_exception(e)
      end
    end
    render json: params[:id]
  end
end
