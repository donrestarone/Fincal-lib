gem 'activerecord', '=4.2.10' #when we are using active record make sure its this version, not the other version we have installed in our machine. 
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'accountdata.sqlite3')

class Account < ActiveRecord::Base
  field :account_name,          as: :string 
  field :category,              as: :string
  field :balance,               as: :float 
  field :interest,              as: :float 
  field :compounding_frequency, as: :integer
  field :compounding_periods,   as: :integer

  
  def view_account
  "#{account_name} TYPE: #{category} BALANCE: $#{balance}"
  end

end

Account.auto_upgrade!

at_exit do 
  ActiveRecord::Base.connection.close 
end



