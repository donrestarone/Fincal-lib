class AccountsController < ApplicationController
	before_action :require_login
	before_action :require_ownership, only: [:show, :edit, :update, :destroy]
	
	def index
		unless current_user
			flash[:warning] = "sign up to add an account"
		end
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
		
		@creation_date = @account.created_at.strftime("%A-%Y-%B-%d")
		
		
	end 

	def update

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

	def destroy
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
				@calculation_performed = 'computed future value:'
				
			when 2 then @result = @account.calculate_pv
				@calculation_performed = 'computed present value:'
				
			when 3 then @result = @account.calculate_fv_annuity
				@calculation_performed = 'computed future value of the annuity payments:'
				
			when 4 then @result = @account.calculate_pv_annuity
				@calculation_performed = 'computed present value of the annuity payments:'

			when 5 then  @result = @account.calculate_interest_rate
				@calculation_performed = 'computed interest rate earned given the interest portion:'
			
		end
		@interest_time = @account.compounding_periods
		@frequency = @account.compounding_frequency
		@interest_portion = @result - account_balance
	end 

	def real_time_tvom
		
	end

	def real_time_tvom_results
		@real_time_account = Account.new 

		if params[:compute_interest_rate]
			@real_time_account.interest = params[:compute_interest_rate][:interest_portion]
			@real_time_account.balance = params[:compute_interest_rate][:pv]
			@real_time_account.compounding_periods = params[:compute_interest_rate][:time]
			@computation = @real_time_account.calculate_simple_interest_rate
		end

		if params[:compute_annuity_payment]
		@real_time_account.interest = params[:compute_annuity_payment][:interest_rate]
		@real_time_account.compounding_frequency = params[:compute_annuity_payment][:compounding_frequency]
		@real_time_account.compounding_periods = params[:compute_annuity_payment][:compounding_periods]
		@real_time_account.balance = params[:compute_annuity_payment][:fv]
		@computation = @real_time_account.size_of_annuity_payment
		end
	end

	private 

	def require_ownership
		owner_id = params[:id]
		the_account = Account.find(owner_id)
		if the_account.user == current_user
				@account = Account.find(params[:id])
				@title = @account.name
		else 
			redirect_to users_accounts_path
		end 
	end
end
