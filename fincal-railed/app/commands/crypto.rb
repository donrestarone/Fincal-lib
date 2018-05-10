class Crypto
	
	def self.coinmarketcap_api_call
		coinmarketcap_response = HTTParty.get('https://api.coinmarketcap.com/v2/ticker/')
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
						coin_hash['equivalent_rate'] = find_delta(coin['quotes']['USD']['price'], coin['quotes']['USD']['percent_change_24h'])
						coins.push coin_hash
					end
			end
		end
		return coins
	end

	def self.find_coin(coin_name)
		coins = coinmarketcap_api_call

		coins.each do |coin|
			if coin['name'] == coin_name.capitalize
				return coin
			else
				return false
			end
		end
	end


	def self.calculate_interest_discounted(interest, present_value)
		rate = interest / (present_value * 1 / 365) * 100
		return rounder(rate)
	end

	def self.calculate_interest_earned(interest, present_value)
		rate = interest / (present_value * 1 / 365) * 100
		return rounder(rate)
	end

	def pass_coin_info(coin)
		#p coin["percent_change_24h"]
		price = coin["price"]
		a24h_delta = coin["percent_change_24h"]
		a7d_delta = coin["percent_change_7_days"]
		find_delta(price, a24h_delta)
	end


	private

	def self.rounder(value)
		rounded_value = value.round(2)
		return rounded_value
	end

	def self.find_delta(price, percent_change)
		if percent_change
			delta = price / 100 * percent_change
			if rounder(delta) < 0
				calculate_interest_discounted(rounder(delta), price)
			elsif rounder(delta) > 0
				calculate_interest_earned(rounder(delta), price)
			end
		end
	end



end