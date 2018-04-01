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
		puts "[1] add savings account" 
		puts "[2] view all savings accounts"
	end 

	def output_option(user_input)
		case user_input
			when 1 then add_savings_account
			when 2 then all_savings_accounts
		end  

	end 

	def add_savings_account
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
			puts "account Name:#{account.view_account_name}"
			puts "account Balance:#{account.view_balance}"
			puts "account Interest:#{account.view_interest_rate}"
			puts "account compounding frequency:#{account.view_compounding_periods}"
			puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
		end
	end 
	

end 

test = Interface.new 

test.main_menue



