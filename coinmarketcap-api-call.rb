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

p coinmarketcap_api_call

