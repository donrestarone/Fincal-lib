require 'sinatra'
require_relative 'fincal-class'

get '/' do
	redirect to('/home')
end 

get '/home' do
	@title = 'Fincal Home'
	@current_time = Time.now
	erb :home 
end 

get '/about' do
	@title = 'About Fincal'
	erb :about
end 

get '/allaccounts' do 
	@title = 'All Accounts'
	@all_accounts = Account.all
	erb :accounts
end 

get '/accounts/:id' do
	@title = 'Account'
	erb :show_account
end 