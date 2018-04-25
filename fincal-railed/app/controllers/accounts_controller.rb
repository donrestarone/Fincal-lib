class AccountsController < ApplicationController
	before_action :require_login
	before_action :require_ownership, only: [:show, :edit, :update, :destroy]
	
	def index
		@accounts = current_user.accounts
		@title = 'All Accounts'
		render :index 
	end 

	def create
		@title = 'Create New Account'
		@account = Account.new
		@account.user = current_user
		@account.name = params[:account][:name]
		@account.category = params[:account][:category]
		@account.balance = params[:account][:balance]
		@account.interest = params[:account][:interest]
		@account.compounding_frequency = params[:account][:compounding_frequency]
		@account.compounding_periods = params[:account][:compounding_periods]
		
		if @account.save
			redirect_to users_accounts_path
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
		# owner_id = (params[:id])
		# the_account = Account.find(owner_id)
		# #if the_account != true
		# 	if the_account.user_id == current_user.id
			
			# 	@account = Account.find(params[:id])
			# 	@title = @account.name
			
			# else 
			# redirect_to users_accounts_path
			# end 
		#else 
			#redirect_to users_accounts_path
		#end 

		#@account = Account.find(params[:id])
		#the above code is problematic. need to implement something like this vv 
		#@account = current_user.accounts
		@creation_date = @account.created_at.strftime("%A-%Y-%B-%d")
		#@last_updated = @account.updated_at.strftime("%Y-%m-%d")
		

		#@creation_date = @account.created_at
		
	end 

	def update

		#need to update this method, this is faulty as well. 
		#@account = Account.find(params[:id])

		@account.name = params[:account][:name]
		@account.category = params[:account][:category]
		@account.balance = params[:account][:balance]
		@account.interest = params[:account][:interest]
		@account.compounding_frequency = params[:account][:compounding_frequency]
		@account.compounding_periods = params[:account][:compounding_periods]

		if @account.save
			redirect_to users_accounts_path
			#'users/accounts'
		else 
			render :new
		end 
	end 

	def destroy

		#and this as well. 
		#@account = Account.find(params[:id])
		@account.destroy
		redirect_to users_accounts_path
	end 

	def tvom 
		@accounts = current_user.accounts
		render :tvom
	end 

	def tvom_results
		@result = "you typed the wrong selection"
		#finds the account that the person chooses in the form from params
		@account = current_user.accounts.find(params[:user_choice][:account])
		account_balance = @account.balance
		

		


		#assigns the value that the user chooses for the function they want to invoke on the account
		@selection = params[:user_choice][:choice].to_i
		case @selection
			when 1 then @result =  @account.calculate_fv 
				@calculation_performed = 'computed future value'
				@interest_time = @account.compounding_periods
				@frequency = @account.compounding_frequency
			when 2 then @result = @account.calculate_pv
				@calculation_performed = 'computed present value'
				@interest_time = @account.compounding_periods
				@frequency = @account.compounding_frequency
			when 3 then @result = @account.calculate_fv_annuity
				@calculation_performed = 'computed future value of the annuity payments'
				@interest_time = @account.compounding_periods
				@frequency = @account.compounding_frequency
			when 4 then @result = @account.calculate_pv_annuity
				@calculation_performed = 'computed present value of the annuity payments'
				@interest_time = @account.compounding_periods
				@frequency = @account.compounding_frequency
		end
		@interest_portion = @result - account_balance
	end 

	private 

	def require_ownership
		owner_id = (params[:id])
		the_account = Account.find(owner_id)
		if the_account.user_id == current_user.id
			
				@account = Account.find(params[:id])
				@title = @account.name
			
		else 
			redirect_to users_accounts_path
		end 
	end
end
