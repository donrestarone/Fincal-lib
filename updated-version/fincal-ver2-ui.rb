require_relative 'fincal-ver2.rb'

class Interface 
	
	def main_menue
		while true 
			print_main_menue
			user_input = gets.chomp.to_i
			output_option(user_input)
		end 
	end 

	def print_main_menue
		puts "[1] ADD savings account" 
		puts "[2] VIEW all savings accounts"
		puts "[3] ADD investment account" 
		puts "[4] VIEW all investments"
		puts "[5] total savings/investments REPORT" 
		puts "[6] aggregate CASHFLOW statement"


	end 

	def output_option(user_input)
		case user_input
			when 1 then add_savings_account
			when 2 then all_savings_accounts
			when 3 then add_investment
			when 4 then all_investments
			when 5 then report
			when 6 then cash_flow_statement
			when 7 then report
			when 8 then cash_flow_statement

		end  

	end 

	def report
		puts "your savings total is $#{Account.savings_report.inspect}"
		puts "your investment total is $#{Account.investment_report.inspect}"
	end 

	def add_savings_account #fix looping twice issue
		p "please enter account name"
		account_name = gets.chomp
		p "enter account balance"
		balance = gets.chomp
		p "enter interest rate"
		interest = gets.chomp 
		p "enter how many times a year interest would be compounded in this account"
		compounding_periods = gets.chomp

		Account.add_savings_account(account_name, balance, interest, compounding_periods)
	end 

	def all_savings_accounts 
		Account.view_savings_accounts.each do |account|
			puts "=================================================================="
			puts "account Name:#{account.view_account_name.upcase}"
			puts "account Balance:#{account.view_balance}"
			puts "account Interest:#{account.view_interest_rate}"
			puts "account compounding frequency:#{account.view_compounding_periods}"
			puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
		end
	end 

	def cash_flow_statement
		p "enter aggregate fixed income"
		fixed_income = gets.chomp.to_i 
		p "enter aggregate fixed costs"
		fixed_costs = gets.chomp.to_i
		Cashflow.cashflow_direction(fixed_income, fixed_costs)
		Cashflow.fixed_earning_spending_ratio(fixed_income, fixed_costs)

	end 

	def add_investment
		p "please enter account name"
		account_name = gets.chomp
		p "enter account balance"
		balance = gets.chomp
		p "enter interest rate"
		interest = gets.chomp 
		p "enter how many times a year interest would be compounded in this account"
		compounding_periods = gets.chomp

		Account.add_investment_account(account_name, balance, interest, compounding_periods)
	end

	def all_investments 
		Account.view_investments.each do |investment|
			puts "=================================================================="
			puts "account Name:#{investment.view_account_name.upcase}"
			puts "account Balance:#{investment.view_balance}"
			puts "account Interest:#{investment.view_interest_rate}"
			puts "account compounding frequency:#{investment.view_compounding_periods}"
			puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
		end 
	end 
	

end 

test = Interface.new 

test.main_menue



