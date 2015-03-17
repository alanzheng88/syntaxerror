class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def column_names_with_exclusions(column_names, exclusions)
  	return column_names.delete_if{|column_name| exclusions.include?(column_name)}
  end
end
