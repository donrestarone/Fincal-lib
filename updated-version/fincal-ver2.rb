#accounts class will handle all the arrays of hashes
class Account
@@savings_accounts = []
@@investments = []
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
		return @balance.to_f
	end 

	def view_interest_rate
		return @interest
	end 

	def view_compounding_periods 
		return @compounding_periods
	end 
	
	def self.add_savings_account(account_name, balance, interest, compounding_periods) 
		account = Account.new(account_name, balance, interest, compounding_periods)
		account.save_savings_account
		return account 
	end

	def self.add_investment_account(account_name, balance, interest, compounding_periods) 
		investment_account = Account.new(account_name, balance, interest, compounding_periods) 
		investment_account.save_investment_account
		return investment_account

	end

	def self.view_investments
		return @@investments
	end 

	def save_savings_account #writer 
		@@savings_accounts.push(self)
	end 

	def save_investment_account #writer 
		@@investments.push(self)
	end 

	def  self.view_savings_accounts 
		return @@savings_accounts
	end 

	def self.investment_report 
		total = 0 
		@@investments.each do |investment|
			total += investment.view_balance
		end
		return total.to_f
	end 

	def self.savings_report
		total = 0 
		@@savings_accounts.each do |account|
			 total += account.view_balance.to_f

		end 
		return total.to_f
	end 
end 

	#testing ACCOUNT CLASS 
Account.add_savings_account("test account 1", 200, 0.005, 4)
Account.add_savings_account("test account 2", 2000, 0.005, 4)
Account.add_savings_account("test account 3", 2222, 0.005, 4)
Account.add_savings_account("test account 4", 2.2, 0.005, 4)



Account.add_investment_account("investment account 1", 300, 0.005, 4)
Account.add_investment_account("investment account 2", 3000, 0.005, 4)
Account.add_investment_account("investment account 3", 3222, 0.005, 4)
Account.add_investment_account("investment account 4", 3.2, 0.005, 4)

class Cashflow
	
	
	@@liabilities = []
	def initialize(fixed_income, fixed_costs)
		@fixed_income = fixed_income
		@fixed_costs = fixed_costs
		
	end 
	#reader methods 
	def read_fixed_income 
		return @fixed_income
	end 

	def read_fixed_costs 
		return @fixed_costs
	end 

	def self.cashflow_direction(fixed_income, fixed_costs)
		@fixed_income = fixed_income
		@fixed_costs = fixed_costs
		flow = fixed_income - fixed_costs
			if flow > 0 
				p "your positive cash flow is $#{flow}".upcase
			else flow < 0
				p "your negative cash flow is $#{flow}".upcase
			end
			return flow
	end

	def self.fixed_earning_spending_ratio(fixed_income, fixed_costs)
		ratio = ((fixed_income.to_f / fixed_costs.to_f) * 100) - 100
		p "your earning #{ratio}% more than you are spending "	
		return ratio

	end 



	def view_investments

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