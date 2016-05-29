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
end