class TrackController < ApplicationController
  def track
      id = params[:id].to_i
      case id
          when 1
              1 / 0
          when 2
            begin
                1 / 0
              rescue ZeroDivisionError => exception
                Raven.capture_exception(exception)
              end
          when 3
            begin
                1 / 0
            rescue ZeroDivisionError => exception
                Sentry.capture_exception(exception)
            end
      end
      render json: params[:id]
  end
end
