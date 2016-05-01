class SettingsController < ApplicationController
  def new
    form Settings::Create
  end

  def create
    run Settings::Create do |op|
      return redirect_to index_path
    end
    render action: :new
  end

  def edit

  end

  def update

  end
end
