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

# class tvom
# 	def perpetuity(interest_rate) 

# 	end 

# end 

#tvom = Tvom.new("test calculation", 50, 1, 12)
tvom = Tvom.add_tvom_calculation("test calculation", 50, 1, 12)

puts tvom.view_all_tvom.inspect

puts tvom.view_calculation_name 

puts tvom.view_interest

#calculate fv works 
puts tvom.calculate_fv("test", 0.5, 1, 12, 1000).inspect


# (name, interest_rate, years, compounding_frequency, future_value)
puts tvom.calculate_pv("test", 9, 3, 1, 25000).inspect

puts 
puts 
puts tvom.calculate_fv_annuity(10000, 11, 2, 1, 0).inspect

puts 
puts 
puts tvom.calculate_pv_annuity(10000, 11, 2, 1, 0).inspect
