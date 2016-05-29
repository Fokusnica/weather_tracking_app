require 'clockwork'
require './config/boot'
require './config/environment'

module Clockwork
  handler do |job|
    puts "Running #{job}"
  end

  every(3.hours, 'check weather forecast') do
    DeleteOldWeatherForecastJob.perform_later
    PrepareForWeatherForecastJob.perform_later
  end
end
