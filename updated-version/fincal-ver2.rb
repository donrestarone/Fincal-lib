#accounts class will handle all the arrays of hashes
class Account

@@savings_accounts = []
@@investments = []
@@liabilities = []

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

	def self.add_liability(account_name, balance, interest, compounding_periods) #here account name is the name of the liability, balance is the liability amount, and compounding periods is how often this payment needs to be disbursed(assuming no interest)
		liability = Account.new(account_name, balance, interest, compounding_periods)
		liability.save_liability
		return liability
	end 

	def self.view_liabilities 
		return @@liabilities
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

	def save_liability #writer
		@@liabilities.push(self)
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

	def self.liability_report
		total = 0 
		@@liabilities.each do |liability|
			total += liability.view_balance
		end
		return total.to_f
	end 

	def self.bottom_line 
		total = 0 	
		aggregate_savings = self.savings_report
		aggregate_investments = self.investment_report
		aggregate_liabilities = self.liability_report
		total = (aggregate_savings + aggregate_investments) - aggregate_liabilities
		return total 
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

Account.add_liability("liability 1", 30, 0.005, 4)
Account.add_liability("liability 1", 4000, 0.005, 4)
Account.add_liability("liability 1", 322, 0.005, 4)
Account.add_liability("liability 1", 3.2, 0.005, 4)

class Tvom 
	def initialize(interest_rate, years, compounding_frequency)
		@interest_rate = interest_rate
		@years = years 
		@compounding_frequency = compounding_frequency
	end 
	

end 






class Cashflow #< Account 
@@aggregate_fixed_income = 0
@@aggregate_fixed_cost = 0
	
	def initialize(fixed_income, fixed_costs)
		@fixed_income = fixed_income
		@fixed_costs = fixed_costs

		@@aggregate_fixed_income = @fixed_income
		@@aggregate_fixed_cost = @fixed_costs
		
	end 
	#reader methods 
	def read_fixed_income 
		return @fixed_income
	end 

	def read_fixed_costs 
		return @fixed_costs
	end 

	def self.add_cashflow(fixed_income, fixed_costs)
		cashflow = Cashflow.new(fixed_income,fixed_costs)
		@@aggregate_fixed_income += fixed_income
		@@aggregate_fixed_cost += fixed_costs
		
	end

	def self.cashflow_direction(fixed_income, fixed_costs)
		@fixed_income = fixed_income
		@fixed_costs = fixed_costs
		flow = fixed_income - fixed_costs
		absolute_flow = flow.abs
			if flow > 0 
				p "your positive cash flow is $#{flow}".upcase
			else flow < 0
				p "your negative cash flow is $#{absolute_flow}".upcase
			end
			return flow
	end

	def self.fixed_earning_spending_ratio(fixed_income, fixed_costs)
		ratio = ((fixed_income.to_f / fixed_costs.to_f) * 100) - 100
		absolute_ratio = ratio.abs
		if fixed_income > fixed_costs
			p "your earning #{ratio}% more than you are spending"	
		else 
			p "your earning #{absolute_ratio}% less than you are spending" 
		end
		return ratio

	end 

	def self.calculate_equivalent_rate(month_range)
		profit = @@aggregate_fixed_income - @@aggregate_fixed_cost
		aggregate_fixed_cost = @@aggregate_fixed_cost
		equivalent_rate = (profit / aggregate_fixed_cost) * 100 
		#return equivalent_rate.to_f

	end
end 


class Tvom
	@@tvom_calculations = []
	
	def initialize(calculation_name, interest_rate, years, compounding_frequency) #compounding frequency per year
		@calculation_name = calculation_name
		@interest_rate = interest_rate 
		@years = years 
		@compounding_frequency = compounding_frequency
	end 

	def view_calculation_name #reader
		return @calculation_name
	end 

	def view_interest #reader
		return @interest_rate.to_f
	end 

	def view_years #reader
		return @years.to_i 
	end 

	def view_compounding_freq #reader
		return @compounding_frequency.to_i 
	end 

	def view_all_tvom 
		return @@tvom_calculations
	end 

	def self.add_tvom_calculation(calculation_name, interest_rate, years, compounding_frequency) #create a tvom instance 
		tvom_calculation = Tvom.new(calculation_name, interest_rate , years, compounding_frequency)
		tvom_calculation.save_tvom_instance
		return tvom_calculation
	end 

	def save_tvom_instance #writer
		@@tvom_calculations.push(self)
	end 

	def calculate_fv(calculation_name, interest_rate, years, compounding_frequency, present_value)
		n = years * compounding_frequency
		interest_factor = (1 + interest_rate.to_f / 100)
		fv = present_value * interest_factor ** n
		
		return fv
	end 

	def calculate_pv(calculation_name, interest_rate, years, compounding_frequency, future_value)
		n = years * compounding_frequency
		interest_factor = ( 1 + interest_rate.to_f / 100 ) 
		pv = (future_value) / interest_factor ** n
		return pv
		
	end

	def calculate_fv_annuity(calculation_name, interest_rate, years, compounding_frequency, future_value) #here calculation name is the annuity payment
		n = years * compounding_frequency
		interest_factor = ( 1 + interest_rate.to_f / 100 ) 
		interest_decimal = (interest_rate.to_f / 100)
		fv = calculation_name * (interest_factor.to_f ** n  - 1) / interest_decimal
		return fv
	end 

	def calculate_pv_annuity(calculation_name, interest_rate, years, compounding_frequency, future_value) #here calculation name is the annuity payment
		n = years * compounding_frequency
		interest_factor = ( 1 + interest_rate.to_f / 100 ) ** n 
		interest_decimal = (interest_rate.to_f / 100)
		pv = calculation_name * ( (1 - (1 / interest_factor) ) / interest_decimal)
	end
end 

	#TESTING CASHFLOW CLASS 
#test1 = Cashflow.new(10, 5)
# #test1.cashflow_direction(5, 50)  #CASHFLOW DIRECTION WORKS 
# puts Cashflow.calculate_equivalent_rate(5).inspect









#time value of money class. this will be the parent class to the investments class 
#class Time_value_of_money 


#end 