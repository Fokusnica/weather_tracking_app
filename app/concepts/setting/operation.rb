module Settings
  class Create < Trailblazer::Operation
    include Model
    model Setting, :create

    contract do
      property :city, virtual: true
      property :user_id
    end

    def process(params)
      validate(params[:setting]) do |f|
        f.save
        Cities::Create.(city: {city_name: params[:setting]['city'], setting_id: @model.id})
      end
    end

  end
end