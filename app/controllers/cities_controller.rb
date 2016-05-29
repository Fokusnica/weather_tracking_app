class CitiesController < ApplicationController

  def new
    form(Cities::Create, params: params.merge(user: current_user))
  end

  def create
    run Cities::Create do |op|
      flash[:notice] = 'Your city was successfully created!'
      return redirect_to root_path
    end
    flash.now[:notice] = @form.errors.full_messages
    render action: :new
  end

  def index
  end

end
