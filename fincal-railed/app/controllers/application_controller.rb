class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
     @current_user ||= session[:user_id] && User.find_by_id(session[:user_id]) # Use find_by_id to get nil instead of an error if user doesn't exist
  end

  def require_login
  	# Check if session has user_id nil
  	if session[:user_id] == nil
  		# Redirect to root path
  		redirect_to new_users_path
  	end
  end

  def already_logged_in
    if session[:user_id] != nil
      redirect_to root_path
    end
  end

  def welcome
    @title = 'Fincal'
    @date = Time.now.strftime("%A-%B-%d-%Y")
    @dev = "Shashike J"
    @version = 0.85
    @update_date = "Sunday/May/5/2018"
    @welcome_quote = User.quotes

    
      @coins = Account.coinmarketcap_api_call
    
  end

   helper_method :current_user


private

    def current_user
    user_id = session[:user_id]

    #makes sure if user_id exists.
    user_id && User.find(user_id)
  end

end
