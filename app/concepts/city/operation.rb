module Cities
  class Create < Trailblazer::Operation
    include Model
    model City, :create

    contract do
      property :city_name
      property :user_id
    end

    def process(params)
      validate(params[:city]) do |f|
        f.save
      end
      GetWeatherForecastJob.perform_now(@model)
    end
  end

  class Update < Create
    action :update

    def process(params)
      validate(params) do |f|
        if f.changed?('city_name')
          reset_weather
        end
        f.save
      end
      GetWeatherForecastJob.perform_now(@model)
    end

    private

    def reset_weather
      Weather.where(city_id: @model.id).delete_all
    end
  end


end