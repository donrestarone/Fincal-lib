class UserMailer < ApplicationMailer
	
	def welcome_email(user)	
		@url = 'http://example.com/login'
		@user = user
		mail(to: user.email, subject: 'Welcome to MyFincal')
		#params[:user][:email]
	end

	def account_email(user, account)
		@user = user
		@account = account
		mail(to: user.email, subject: "You created an account")
	end

	def calculation_email()
	
end
