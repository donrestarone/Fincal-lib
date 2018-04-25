class Account < ApplicationRecord

	belongs_to :user
	validates :name, length: {in: 4..40}, presence: true, uniqueness: true
	validates :category, presence: true

	def calculate_fv
		interest_factor = (1 + (interest.to_f / 100)/compounding_frequency)
		fv = balance * interest_factor ** compounding_periods
	end 

	def calculate_pv
		interest_factor = ( 1 + interest.to_f / 100 ) 
		pv = (balance) / interest_factor ** compounding_periods
		return pv
		
	end

	def calculate_fv_annuity(payment, interest_rate, years, compounding_frequency, future_value) #here calculation name is the annuity payment
		n = years * compounding_frequency
		interest_factor = ( 1 + interest_rate.to_f / 100 ) 
		interest_decimal = (interest_rate.to_f / 100)
		fv = payment * (interest_factor.to_f ** n  - 1) / interest_decimal
		return fv
	end 

	def calculate_pv_annuity(payment, interest_rate, years, compounding_frequency, future_value) #here calculation name is the annuity payment
		n = years * compounding_frequency
		interest_factor = ( 1 + interest_rate.to_f / 100 ) ** n 
		interest_decimal = (interest_rate.to_f / 100)
		pv = payment * ( (1 - (1 / interest_factor) ) / interest_decimal)
	end

end

