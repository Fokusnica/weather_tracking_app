class WeatherGraph

  def self.data_for_temperature_graph(user)
    weather_arr = user.city.weathers
    data_for_graph= {
        labels: [] ,
        data: []
    }
    weather_arr.each do |weather|
      data_for_graph[:labels].push(((weather.time.localtime).strftime('%l:%M%p')))
      data_for_graph[:data].push(weather.current_temperature)
    end

    data_for_graph
  end

end