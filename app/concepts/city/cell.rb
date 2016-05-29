class City::Cell < Cell::Concept

  class CreateCitySettings < Cell::Concept
    inherit_views City::Cell

    def show
      render(:create_city_settings)
    end
  end

end
