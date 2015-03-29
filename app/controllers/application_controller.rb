# /controllers/application_controller.rb

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :set_user_variable, except: [:login_attempt]

  def set_user_variable
	@user ||= User.where(username: session[:username]).first if session[:username].present?
  end

  # DELETE /    :destroy_user_session
  def destroy_user_session
  	reset_session
  	redirect_to root_path
  end

end
