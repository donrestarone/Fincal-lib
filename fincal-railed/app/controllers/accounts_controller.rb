class AccountsController < ApplicationController
	
	def index
		@accounts = Account.all
		#render: index 
	
	end 

	def create
		@account = Account.new
		@account.account_name = params[:account][:account_name]
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
		@account = Account.new 
	end 

	def edit
		id = params[:id]
		@account = Account.find(id)

	end 

	def show 
		@account = Account.find(params[:id])
	end 

	def update
		@account = Account.find(params[:id])

		@account.account_name = params[:account][:account_name]
		@account.category = params[:account][:category]
		@account.balance = params[:accounts][:balance]
		@account.interest = params[:accounts][:interest]
		@account.compounding_frequency = params[:accounts][:compounding_frequency]
		@account.compounding_periods = params[:accounts][:compounding_periods]

		if @account.save
			redirect_to '/accounts'
		else 
			render :new
		end 
	end 

	def destroy
		@account = Account.find(params[:id])
		@account.destroy
		redirect_to accounts_path
	end 
end
