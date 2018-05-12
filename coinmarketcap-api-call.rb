require 'httparty'

response = HTTParty.get('https://api.coinmarketcap.com/v2/ticker/')

parsed_response = JSON.parse(response.body)

p parsed_response.keys

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
			coins.push coin_hash
		end
	end
end


coins.each do |coin|
	coin['name']
	coin['price']
	coin['percent_change_24h']
	coin['percent_change_7_days']
end

# p coins


def parse_api_response(raw_response)
	return JSON.parse(raw_response)
end


def coinmarketcap_api_call
	coinmarketcap_response = HTTParty.get('https://api.coinmarketcap.com/v2/ticker/')
	parsed_response = parse_api_response(coinmarketcap_response.body)
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
					coins.push coin_hash
				end
		end
	end
	return coins
	coins.each do |coin|
		coin['name']
		coin['price']
		coin['percent_change_24h']
		coin['percent_change_7_days']
	end
end

def find_coin(coin_name)
	coins = coinmarketcap_api_call

	coins.each do |coin|
		if coin['name'] == coin_name.capitalize
			pass_coin_info(coin)
		else
			return false
		end
	end
end


def rounder(value)
	rounded_value = value.round(2)
	return rounded_value
end


def find_delta(price, percent_change)
		delta = price / 100 * percent_change
		if rounder(delta) < 0
			calculate_interest_discounted(rounder(delta), price)
		else 
			calculate_interest_earned(rounder(delta))
		end
end

def calculate_interest_discounted(interest, present_value)
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

find_coin('Bitcoin')



