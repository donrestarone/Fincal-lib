class Crypto
	
	def self.coinmarketcap_api_call
		begin
			coinmarketcap_response = HTTParty.get('https://api.coinmarketcap.com/v2/ticker/')
		rescue SocketError => e
			print e
			return false
		end
		parsed_response = JSON.parse(coinmarketcap_response.body)
		data = parsed_response['data']
		coins = []
		data.each do |hash|
			hash.each do |coin|
				coin_hash = Hash.new
					if coin['name']
						coin_hash['name'] = coin['name'] 
						coin_hash['price'] = coin['quotes']['USD']['price']
						coin_hash['percent_change_24h'] = coin['quotes']['USD']['percent_change_24h']
						coin_hash['percent_change_7_days'] = coin['quotes']['USD']['percent_change_7d']
						coin_hash['equivalent_rate_24h'] = find_delta(coin['quotes']['USD']['price'], coin['quotes']['USD']['percent_change_24h'])
						coin_hash['equivalent_rate_7d'] = calculate_interest_earned_7_days(coin['quotes']['USD']['price'], coin['quotes']['USD']['percent_change_7d'])
						coins.push coin_hash
					end
			end
		end
		return coins
	end

	def self.calculate_interest_earned_7_days(present_value, delta)
		if delta
			interest = present_value / 100 * delta
			rate = interest / (present_value * 7 / 365) * 100
			return rounder(rate)
		end
	end

	def self.calculate_interest_earned(interest, present_value)
		rate = interest / (present_value * 1 / 365) * 100
		return rounder(rate)
	end

	private

	def self.rounder(value)
		rounded_value = value.round(2)
		return rounded_value
	end

	def self.find_delta(price, percent_change)
		if percent_change
			delta = price / 100 * percent_change
			calculate_interest_earned(rounder(delta), price)
		end
	end
end