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

  def edit
    form(Cities::Update, params: {id: params[:id], user: current_user })
    render action: :edit
  end

  def update
    run Cities::Update, params: params['city'].merge(id: current_user.city.id) do |op|
      flash[:success] = 'Your city was successfully updated!'
      return redirect_to root_path
    end
    flash.now[:error] = @form.errors.full_messages
    render action: :edit
  end
  def index
  end

end
