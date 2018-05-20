class UserMailer < ApplicationMailer
	def welcome_email
		
		@url = 'http://example.com/login'
		
		mail(to: params[:user][:email], subject: 'Welcome to MyFincal')
	end
	
end
