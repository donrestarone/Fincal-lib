#accounts class will handle all the arrays of hashes
class Account
@@savings_accounts = []
	def initialize(account_name, balance, interest, compounding_periods)
		@account_name = account_name
		@balance = balance
		@interest = interest
		@compounding_periods = compounding_periods
		
	end 

	#reader methods 
	def view_account_name
		return @account_name
	end 

	def view_balance 
		return @balance 
	end 

	def view_interest_rate
		return @interest
	end 

	def view_compounding_periods 
		return @compounding_periods
	end 
	
	def self.add_savings_account(account_name, balance, interest, compounding_periods)
		p "please enter account name"
		account_name = gets.chomp
		p "enter account balance"
		balance = gets.chomp
		p "enter interest rate"
		interest = gets.chomp 
		p "enter how many times a year interest would be compounded in this account"
		compounding_periods = gets.chomp

		account = Account.new(account_name, balance, interest, compounding_periods)
		account.save_savings_account
		return account 
	end

	def save_savings_account 
		@@savings_accounts.push(self)
	end 

	def  self.view_savings_accounts 
		return @@savings_accounts
	end 



end 
	#testing accounts class
# test_account = Account.new('account 1', 50, 0.5, 5)
# test_account.add_savings_account('account', 50, 0.05, 12)

# puts test_account.view_savings_accounts.inspect


#cashflow class will calculate aggregate values and will be the parent of Time_value_of_money
class Cashflow
	
	@@investments = []
	@@liabilities = []
	def initialize(fixed_income, fixed_costs, interest_savings, interest_investments = nil, liabilities = nil)
		@fixed_income = fixed_income
		@fixed_costs = fixed_costs
		@interest_savings = interest_savings
		@interest_investments = interest_investments
		@liabilities = liabilities 
	end 

	def cashflow_direction(fixed_income, fixed_costs)
		flow = fixed_income - fixed_costs
			if flow > 0 
				p "your positive cash flow is $#{flow}"
			else flow < 0
				p "your negative cash flow is $#{flow}"
			end
	end

	

	def save_savings_account 
		@@savings_accounts << self
	end 



	def view_investments

	end

	def add_investments=

	end 

	def view_liabilities

	end 
	
	def add_liabilities=

	end
end 

	#TESTING CASHFLOW CLASS 
# test1 = Cashflow.new(10, 5, 0.5)
#test1.cashflow_direction(5, 50)  #CASHFLOW DIRECTION WORKS 












#time value of money class. this will be the parent class to the investments class 
#class Time_value_of_money 


#end 