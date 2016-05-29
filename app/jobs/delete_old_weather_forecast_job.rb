class DeleteOldWeatherForecastJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
   Weather.where('created_at < ?', Time.now.in_time_zone).delete_all
  end
end
