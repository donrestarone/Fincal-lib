class Account < ApplicationRecord

	belongs_to :user
	validates :name, length: {in: 4..40}, presence: true, uniqueness: true
	validates :category, presence: true

	def calculate_fv
		interest_factor = (1 + (interest.to_f / 100) / compounding_frequency)
		fv = balance * interest_factor ** compounding_periods
		rounded_fv = fv.round(2)
		return rounded_fv
	end 

	def calculate_pv
		interest_factor = ( 1 + (interest.to_f / 100) / compounding_frequency ) 
		pv = (balance) / interest_factor ** compounding_periods
		rounded_pv = pv.round(2)
		return rounded_pv
		
	end

	def calculate_fv_annuity  
		interest_factor = ( 1 + (interest.to_f / 100) / compounding_frequency ) 
		interest_decimal = (interest.to_f / 100) / compounding_frequency
		fv = balance * (interest_factor.to_f ** compounding_periods - 1) / interest_decimal.to_f
		rounded_fv = fv.round(2)
		return rounded_fv
	end 

	def calculate_pv_annuity 
		interest_factor = ( 1 + (interest.to_f / 100) / compounding_frequency ) ** compounding_periods 
		interest_decimal = (interest.to_f / 100) / compounding_frequency
		pv = balance * ( (1 - (1 / interest_factor) ) / interest_decimal)
		rounded_pv = pv.round(2)
		return rounded_pv
	end

	def calculate_interest_rate 
		rate = interest / (balance * compounding_periods / compounding_frequency) 
		converted_rate = rate * 100
		rounded_rate = converted_rate.round(3)
		return rounded_rate
	end 
end

