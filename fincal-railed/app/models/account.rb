class Account < ApplicationRecord

	belongs_to :user
	validates :name, length: {in: 4..40}, presence: true, uniqueness: true
	validates :category, presence: true

	def calculate_fv
		fv = balance * interest_factor(interest, compounding_frequency) ** compounding_periods
		rounded_fv = fv.round(2)
		return rounded_fv
	end

	def calculate_pv
		pv = (balance) / interest_factor(interest, compounding_frequency) ** compounding_periods
		rounded_pv = pv.round(2)
		return rounded_pv
	end

	def calculate_fv_annuity
		fv = balance * (interest_factor(interest, compounding_frequency) ** compounding_periods - 1) / interest_decimal(interest, compounding_frequency)
		rounded_fv = fv.round(2)
		return rounded_fv
	end

	def calculate_pv_annuity
		interest_factor = ( 1 + (interest.to_f / 100) / compounding_frequency ) ** compounding_periods
		pv = balance * ( (1 - (1 / interest_factor) ) / interest_decimal(interest, compounding_frequency))
		rounded_pv = pv.round(2)
		return rounded_pv
	end

	def calculate_simple_interest_rate
		rate = interest / (balance * compounding_periods / 365)
		converted_rate = rate * 100
		rounded_rate = converted_rate.round(2)
		return rounded_rate
	end

	def calculate_size_of_annuity_payment
		interest_decimalized = interest.to_f / 100
		interest_equalized = interest_decimalized / compounding_frequency
		interest_factor = (1 + interest_equalized) ** compounding_periods
		interest_factor_minus_one = interest_factor.to_f - 1
		denominator = interest_factor_minus_one / interest_equalized.to_f
		numerator = balance / denominator
		rounded_annuity = numerator.round(2)
	end

	private

	def interest_factor(interest, compounding_frequency)	#refactor this to use the method below
		interest_factor = (1 + (interest.to_f / 100) / compounding_frequency)
		return interest_factor
	end

	def interest_decimal(interest, compounding_frequency)
		decimal = (interest.to_f / 100) / compounding_frequency
		return decimal
	end

end
