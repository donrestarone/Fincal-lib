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
		puts "[4] ADD liability" 
		puts "[5] VIEW all investments/liabilities"
		puts "[6] total savings/investments REPORT"
		puts "[7] calculate aggregate CASHFLOW statement"
		puts "[8] TVOM"


	end 

	def output_option(user_input)
		case user_input
			when 1 then add_savings_account
			when 2 then all_savings_accounts
			when 3 then add_investment
			when 4 then add_liability
			when 5 then all_investments
			when 6 then report
			when 7 then cash_flow_statement
			when 8 then tvom
			when 9 then cash_flow_statement

		end  

	end 

	def report
		puts "your savings total is $#{Account.savings_report.inspect}"
		puts "your investment total is $#{Account.investment_report.inspect}"
		puts "your total liabilities are $#{Account.liability_report.inspect}"
		puts "your bottom-line is $#{Account.bottom_line.inspect}"
			puts "enter how many months this data is for:"
				months = gets.chomp.to_i
			if months > 0 
				Cashflow.calculate_equivalent_rate(months)
				p "you earned an equivalent interest rate of #{calculate_equivalent_rate(months)} over a period of #{months} "
			else 
				p "month range not specified, equivalent rate not calculated."
			end 


	end 
	
	def add_liability 
		p "please enter liability name"
		account_name = gets.chomp
		p "enter the amount of liability"
		balance = gets.chomp
		p "enter interest rate, 0 if N/A"
		interest = gets.chomp 
		p "if it is a recurring liability, enter frequency per year"
		compounding_periods = gets.chomp
		Account.add_liability(account_name, balance, interest, compounding_periods)
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
		Cashflow.add_cashflow(fixed_income, fixed_costs)
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
		puts "					$$Investments$$"
		Account.view_investments.each do |investment|
			 
			puts "=================================================================="
			puts "account Name:#{investment.view_account_name.upcase}"
			puts "account Balance:#{investment.view_balance}"
			puts "account Interest:#{investment.view_interest_rate}"
			puts "account compounding frequency:#{investment.view_compounding_periods}"
			puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
		end 
		puts "					~~Liabilities~~"
		Account.view_liabilities.each do |liability|
			puts "=================================================================="
			puts "account Name:#{liability.view_account_name.upcase}"
			puts "account Balance:#{liability.view_balance}"
			puts "account Interest:#{liability.view_interest_rate}"
			puts "account compounding frequency:#{liability.view_compounding_periods}"
			puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
		end 
	end 

	class Tvom 
		p "enter the calculation you would like to perform: fv, pv, annuity pv, annuity fv"
		input = gets.chomp 
		if input == "fv"
			p "enter the "
		elsif input == "pv"

		elsif input == "annuity pv"

		elsif input == "annuity fv"


		end 
	end 
	

end 

test = Interface.new 

test.main_menue



