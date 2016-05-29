class Weather::Cell < Cell::Concept

  class DailyWeather < Cell::Concept
    inherit_views Weather::Cell

    def show
      @weather_array = Weather.where(city_id: options[:city].id)
      render(:daily_weather)
    end
  end

  class WeatherTable < Cell::Concept
    inherit_views Weather::Cell

    def show
      @weather_array = options[:weather_array]
      render(:weather_table)
    end
  end

  class WeatherTablePart < Cell::Concept
    inherit_views Weather::Cell

    def show
      @weather = options[:weather]
      render(:weather_table_part)
    end
  end

  class WeatherGraph < Cell::Concept
    inherit_views Weather::Cell

    def show
      @weather_array = options[:weather_array]

      render(:weather_graph)
    end
  end
end
