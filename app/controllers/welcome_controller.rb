class WelcomeController < ApplicationController
  def index
    if current_user.present?
      if current_user.city.present?
        concept('weather/cell/daily_weather', nil, {city: current_user.city})
      else
        concept('city/cell/create_city_settings', nil)
      end
    else
      redirect_to  sessions_sign_in_url
    end
    get_graph_data if current_user && current_user.city
  end

  def get_graph_data
    gon.time_labels = WeatherGraph.data_for_temperature_graph(current_user)[:labels]
    gon.temperature_data = WeatherGraph.data_for_temperature_graph(current_user)[:data]
  end
end
