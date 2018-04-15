# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Account.create(
	account_name: '#testaccount a sample savings account',
	category: 'savings',
	balance: 555.55,
	interest: 1.5,
	compounding_frequency: 4,
	compounding_periods: 8
)

Account.create(
	account_name: '#testaccount a sample investment account',
	category: 'investment',
	balance: 5555.55,
	interest: 15.5,
	compounding_frequency: 12,
	compounding_periods: 36
)

Account.create(
	account_name: '#testaccount a sample sinking fund',
	category: 'sinking',
	balance: 55555.55,
	interest: 0.5,
	compounding_frequency: 2,
	compounding_periods: 12
)

Account.create(
	account_name: '#testaccount a sample credit card account',
	category: 'liability',
	balance: 55.55,
	interest: 19.5,
	compounding_frequency: 12,
	compounding_periods: 1
)