module Cities
  class Create < Trailblazer::Operation
    include Model
    model City, :create

    contract do
      property :city_name
      property :setting_id
    end

    def process(params)
      validate(params[:city]) do |f|
        f.save
      end
    end
  end
end