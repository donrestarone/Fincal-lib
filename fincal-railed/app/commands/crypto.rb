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
						coins.push coin_hash
					end
			end
		end
		return coins
		Account.compute_coinmarketcap_response(coins)
	end

end