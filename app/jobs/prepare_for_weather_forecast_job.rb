class PrepareForWeatherForecastJob < ActiveJob::Base
  queue_as :default

  def perform
    cities = City.all
    cities.each do |city|
      GetWeatherForecastJob.perform_later(city)
    end
  end
end
