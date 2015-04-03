# /controllers/application_controller.rb

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!, except: [:login, :login_attempt]
  # Must authenticate before granting access to pages
  before_action :authorize_navigation_links, except: [:login_attempt]

  def authorize_navigation_links
    @is_administrator_role = session[:role] == User.site_admin || session[:role] == User.vendor_admin
    @is_not_user_role = session[:role] != User.user
  end

  def authenticate_user!
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      # update role everytime a page is visited
      session[:role] = @current_user.get_role_name
      return
    end
    sign_out
    redirect_to root_path
  end

  def sign_out
  	reset_session
  end

end
