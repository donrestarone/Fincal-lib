def calculate_fv(interest, compounding_periods, compounding_frequency, present_value)
		n = compounding_periods #here n is the number of years
		interest_factor = (1 + (interest.to_f / 100)/compounding_frequency)
		fv = present_value * interest_factor ** n
		puts fv
		return fv
	end 

	def calculate_pv(interest, compounding_periods, compounding_frequency, future_value)
		n = compounding_periods #here n is the number of years
		interest_factor = ( 1 + interest.to_f / 100 ) 
		pv = (future_value) / interest_factor ** n
		pv.round(2) #here .round does not work

		puts pv.round(2) #but it works here when it is being printed
		return pv
		
	end

	def calculate_fv_annuity(payment, interest_rate, years, compounding_frequency) #here calculation name is the annuity payment
		n = years * compounding_frequency
		interest_factor = ( 1 + interest_rate.to_f / 100 ) 
		interest_decimal = (interest_rate.to_f / 100)
		fv = payment * (interest_factor.to_f ** n  - 1) / interest_decimal
		
		p fv
		return fv
	end 

	def calculate_pv_annuity(payment, interest_rate, years, compounding_frequency) #here calculation name is the annuity payment
		#n = years * compounding_frequency
		interest_factor = ( 1 + (interest_rate.to_f / 100) / compounding_frequency ) **  years
		interest_decimal = (interest_rate.to_f / 100) / compounding_frequency
		pv = payment * ( (1 - (1 / interest_factor) ) / interest_decimal)
		p pv
	end

	def size_of_annuity_payment(balance, interest, compounding_frequency, compounding_periods)
		interest_decimalized = interest.to_f / 100
		interest_equalized = interest_decimalized / compounding_frequency
		interest_factor = (1 + interest_equalized) ** compounding_periods 
		interest_factor_minus_one = interest_factor.to_f - 1
		denominator = interest_factor_minus_one / interest_equalized.to_f
		numerator = balance / denominator
		rounded_annuity = numerator.round(2)
	end


	#testing 
#test calculate_fv method. this works
#magic numbers. expected output is 1254.40
# int = 12
# comp_periods = 2
# comp_freq = 1
# pv = 1000


# calculate_fv(int, comp_periods, comp_freq, pv)



#test calculate_pv method. expected output is 19304.59. this works
# int = 9
# comp_periods = 3
# comp_freq = 1
# fv = 25000

# calculate_pv(int, comp_periods, comp_freq, fv)

#test calculate_fv_annuity method. expected output is 21100. this works

# int = 11
# yrs = 2
# comp_freq = 1
# fv = 25000
# pmt = 10000

# calculate_fv_annuity(pmt, int, yrs, comp_freq)




	#test calculate_pv_annuity
# 	int = 11
# 	pmt = 10000
# 	periods = 2
# calculate_pv_annuity(pmt, int, periods, 12 )

size_of_annuity_payment(7000, 9, 2, 16)


	#testing common factor method 
def interest_factor(interest, compounding_frequency)	#refactor this to use the method below
	interest_factor = (1 + (interest.to_f / 100) / compounding_frequency)
	return interest_factor
end 


def interest_decimal(interest, compounding_frequency)
	decimal = (interest.to_f / 100) / compounding_frequency
	return decimal
end

def rounder(value)
	rounded_value = value.round(2)
	return rounded_value
end



def find_delta(price, percent_change)
	delta = price / 100 * percent_change
		if rounder(delta) < 0
			calculate_interest_discounted(rounder(delta))
		else 
			calculate_interest_earned(rounder(delta))
		end
end

def calculate_interest_earned(interest, present_value, days)
	rate = interest / (present_value * compounding_periods / 365) * 100
	return rounder(rate)
end

p find_delta(9134.86, -1.84)






