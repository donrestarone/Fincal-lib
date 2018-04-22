class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
     @current_user ||= session[:user_id] && User.find_by_id(session[:user_id]) # Use find_by_id to get nil instead of an error if user doesn't exist
  end

  def require_login
  	# Check if session has user_id nil
  	if session[:user_id] == nil
  		# Redirect to root path
  		redirect_to root_path
  	end
  end

   helper_method :current_user

private

    def current_user 
    user_id = session[:user_id]

    #makes sure if user_id exists. 
    user_id && User.find(user_id)
  end 

end
