class SessionsController < ApplicationController
	
	def create
	   user = User.find_by_username(params[:user][:username])
	    # If the user exists AND the password entered is correct.
	    if user && user.authenticate(params[:user][:password])
	      # Save the user id inside the browser cookie. This is how we keep the user 
	      # logged in when they navigate around our website.
	      session[:user_id] = user.id
	      redirect_to user_profile_path
	    else
	    # If user's login doesn't work, send them back to the login form.
	      redirect_to login_path
	    end
  	end


   def destroy
  	# set the user_id inside session back to nil
    session[:user_id] = nil
    redirect_to login_path
   end

end
