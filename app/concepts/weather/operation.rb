module Weathers
  class Create < Trailblazer::Operation
    include Model
    model Weather, :create

    contract do
      property :city_id
      property :time
      property :current_temperature
      property :pressure
      property :humidity
      property :wind_speed
      property :wind_direction
      property :cloudiness
      property :description
      property :icon
    end

    def process(params)
      validate(params) do |f|
        f.save
      end
    end
  end
end