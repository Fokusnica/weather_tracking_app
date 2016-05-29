class WelcomeController < ApplicationController
  def index
    get_graph_data if current_user && current_user.city
  end

  def get_graph_data
    gon.time_labels = WeatherGraph.data_for_temperature_graph(current_user)[:labels]
    gon.temperature_data = WeatherGraph.data_for_temperature_graph(current_user)[:data]
  end
end
