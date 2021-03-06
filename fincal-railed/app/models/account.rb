class Account < ApplicationRecord

	belongs_to :user
	validates :name, length: {in: 4..40}, presence: true, uniqueness: true
	validates :category, presence: true
	validates :interest, presence: true
	validates :compounding_periods, presence: true, numericality: {only_integer: true}
	validates :compounding_frequency, presence: true, numericality: {only_integer: true}
	validates :balance, presence: true
	validate :compounding_frequency_must_be_mathematically_valid
	validate :interest_must_be_mathematically_valid
	validate :balance_must_be_mathematically_valid
	
	def calculate_fv
		rounder(balance * interest_factor(interest, compounding_frequency) ** compounding_periods)
	end

	def calculate_pv
		pv = (balance) / interest_factor(interest, compounding_frequency) ** compounding_periods
		return rounder(pv)
	end

	def calculate_fv_annuity
		fv = balance * (interest_factor(interest, compounding_frequency) ** compounding_periods - 1) / interest_decimal(interest, compounding_frequency)
		return rounder(fv)
	end

	def calculate_pv_annuity
		pv = balance * ( (1 - (1 / interest_factor(interest, compounding_frequency) ** compounding_periods) ) / interest_decimal(interest, compounding_frequency))
		return rounder(pv)
	end

	def calculate_simple_interest_rate
		rate = interest / (balance * compounding_periods / 365) * 100
		return rounder(rate)
	end

	def calculate_size_of_annuity_payment
		interest_equalized = convert_interest_rate_to_decimal(interest) / compounding_frequency
		interest_factor = (1 + interest_equalized) ** compounding_periods
		interest_factor_minus_one = interest_factor.to_f - 1
		denominator = interest_factor_minus_one / interest_equalized.to_f
		numerator = balance / denominator
		return rounder(numerator)
	end

	private

	def interest_must_be_mathematically_valid
		unless interest.class == Float || interest.class == Integer
			errors.add(:interest, 'rate can only be a whole or floating point number')
		end
	end

	def balance_must_be_mathematically_valid
		unless balance.class == Float || balance.class == Integer
			errors.add(:balance, 'balance can only be a whole or floating point number')
		end
	end

	def compounding_frequency_must_be_mathematically_valid
		unless compounding_frequency == 1 || compounding_frequency == 2 || compounding_frequency == 4 || compounding_frequency == 12 || compounding_frequency == 365
			errors.add(:compounding_frequency, 'interest can only be compounded annually (1), semiannually (2), quarterly (4), monthly (12) or daily (365)')
		end
	end

	def interest_factor(interest, compounding_frequency)
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

	def convert_interest_rate_to_decimal(interest)
		return interest.to_f / 100
	end
end
