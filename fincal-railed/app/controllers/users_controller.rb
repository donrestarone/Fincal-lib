class UsersController < ApplicationController

  # Make Sure user is logged in
  before_action :require_login, only: %i(profile update changePassword)
  before_action :already_logged_in, only: %i(new login)
  def profile
    @user = current_user
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	# If user get saved to database
    #respond_to do |format|
    	if @user.save
        session[:user_id] = @user.id

        UserMailer.with(user: @user).welcome_email(@user).deliver_now
        
        #format.html {redirect_to users_accounts_path}
    		redirect_to users_accounts_path
    	else
    	#If there is error while saving to database
    		render :new
    	end
    #end

  end


  def update
    if current_user.update_attributes(user_update_params)
      #set Message
    else
      #set Message
    end

    redirect_to user_profile_path

  end


  def changePassword
     user = User.find_by_username(current_user.username)
      # If the user exists AND the password entered is correct.
      if user && user.authenticate(params[:update_password][:old_password]) && params[:update_password][:password] == params[:update_password][:password_confirmation]
        user.password = params[:update_password][:password]
        if user.save
          #set Message
        else
          #set Message
        end
      else
       # set Message; Password dosn't match with confirm
      end
      redirect_to user_profile_path
  end

  def login 
  	@user = User.new
  end

 
  def destroy

    if current_user.delete
      redirect_to root_path
    else
     #Edit Message
     redirect_to user_profile_path
    end

  end

  

  def about 
    render :about
  end 

  private

  def user_params
  	params.require(:user).permit(:first_name,:last_name,:username,:email,:password,:password_confirmation)
  end

  def user_update_params
    params.require(:user).permit(:first_name,:last_name,:username,:email)
  end

end
