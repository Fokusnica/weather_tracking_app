class DeleteOldWeatherForecastJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
   Weather.delete_all
  end
end
