class AccountsController < ApplicationController
	before_action :require_login
	
	def index
		@accounts = Account.all
		@title = 'All Accounts'
		#render: index 
	
	end 

	def create
		@title = 'Create New Account'

		@account = Account.new
		@account.name = params[:account][:name]
		@account.category = params[:account][:category]
		@account.balance = params[:account][:balance]
		@account.interest = params[:account][:interest]
		@account.compounding_frequency = params[:account][:compounding_frequency]
		@account.compounding_periods = params[:account][:compounding_periods]
		
		if @account.save
			redirect_to '/accounts'
		else 
			render :new
		end
	end 

	def new 
		@title = 'Create New Account'
		@account = Account.new 
	end 

	def edit
		id = params[:id]
		@account = Account.find(id)

	end 

	def show 
		@account = Account.find(params[:id])
		@title = @account.name
	end 

	def update
		@account = Account.find(params[:id])

		@account.name = params[:account][:name]
		@account.category = params[:account][:category]
		@account.balance = params[:account][:balance]
		@account.interest = params[:account][:interest]
		@account.compounding_frequency = params[:account][:compounding_frequency]
		@account.compounding_periods = params[:account][:compounding_periods]

		if @account.save
			redirect_to 'users/accounts'
		else 
			render :new
		end 
	end 

	def destroy
		@account = Account.find(params[:id])
		@account.destroy
		redirect_to users_accounts_path
	end 

	def welcome 
		@title = 'Fincal'
		@time = Time.now
		@dev = "Shashike J"
		@version = 0.55
		@date = "wednesday/April/18/2018"

	end 

	def tvom 
		render :tvom
	end 
end
