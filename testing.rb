def calculate_fv(interest, compounding_periods, compounding_frequency, present_value)
		n = compounding_periods
		interest_factor = (1 + (interest.to_f / 100)/compounding_frequency)
		fv = present_value * interest_factor ** n
		
		return fv
	end 

	def calculate_pv(interest, compounding_periods, compounding_frequency, future_value)
		n = years * compounding_frequency
		interest_factor = ( 1 + interest.to_f / 100 ) 
		pv = (future_value) / interest_factor ** n
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