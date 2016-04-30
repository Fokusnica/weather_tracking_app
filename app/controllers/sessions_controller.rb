class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:sign_out]
  before_filter(only: [:sign_in_form, :sign_up_form]) { redirect_to root_path if logged_in? }

  def sign_up_form
    form Session::SignUp
  end

  def sign_up
    run Session::SignUp do |op|
      flash[:notice] = 'Please log in now!'
      return redirect_to sessions_sign_in_path
    end

    render action: :sign_up_form
  end

  def sign_in_form
    form Session::SignIn
  end

  def sign_in
    run Session::SignIn do |op|
      auto_login(op.model, op.contract.remember)
      # return redirect_to monitors_path
    end

    render action: :sign_in_form
  end

  def sign_out
    run Session::SignOut do
      logout
      # redirect_to home_path
    end
  end
end