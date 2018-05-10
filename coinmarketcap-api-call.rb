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
	p coin['name']
	p coin['price']
	p coin['percent_change_24h']
	p coin['percent_change_7_days']
end

p coins
