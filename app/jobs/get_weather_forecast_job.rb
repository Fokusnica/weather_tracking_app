class GetWeatherForecastJob < ActiveJob::Base
  queue_as :default

  def perform(city)
    url = "http://api.openweathermap.org/data/2.5/forecast?q=#{city.city_name}&units=metric&mode=json&&cnt=8&appid=#{ENV['weather_api_key']}"
    result = JSON.parse(RestClient.get url)
    save_weather(result, city.id)
  end

  def save_weather(result, city_id)
    result['list'].each do |weather|
      city_id = city_id
      time =weather['dt_txt']
      current_temperature =weather['main']['temp']
      pressure = weather['main']['pressure']
      humidity = weather['main']['humidity']
      wind_speed = weather['wind']['speed']
      wind_direction = weather['wind']['deg']
      cloudiness = weather['clouds']['all']
      description = weather['weather'][0]['description']
      icon =weather['weather'][0]['icon']
      Weathers::Create.({city_id: city_id,
                         time: time,
                         current_temperature: current_temperature,
                         pressure: pressure,
                         humidity: humidity,
                         wind_speed: wind_speed,
                         wind_direction: wind_direction,
                         cloudiness: cloudiness,
                         description: description,
                         icon: icon
      })
    end
  end
end
