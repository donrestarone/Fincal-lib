class User < ApplicationRecord
	has_many :accounts
	
	has_secure_password

	PASSWORD_FORMAT = /\A
	  (?=.{6,})          # Must contain 6 or more characters
	  (?=.*\d)           # Must contain a digit
	  (?=.*[a-z])        # Must contain a lower case character
	  (?=.*[A-Z])        # Must contain an upper case character
	  						# Must contain a symbol   
	/x

	# (?=.*[[:^alnum:]])

	validates :password, presence: true, length: {:within => 6..40}, format: { with: /\A(?=.{6,})/, message: "length minimum 6 characters"  }, confirmation: true, on: :create
	validates :password, presence: true, length: {:within => 6..40}, format: { with: /\A(?=.*\d)/, message: "must contain a digit"  }, confirmation: true, on: :create
	validates :password, presence: true, length: {:within => 6..40}, format: { with: /\A(?=.*[a-z])/, message: "must contain lower case character"  }, confirmation: true, on: :create
	validates :password, presence: true, length: {:within => 6..40}, format: { with: /\A(?=.*[A-Z])/, message: "must contain uppercase character"  }, confirmation: true, on: :create

	validates :password, allow_nil: true, length: {:within => 6..40}, format: { with: PASSWORD_FORMAT }, confirmation: true, on: :update

	validates :email, presence: true, uniqueness: true
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

	validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\z/,message: "Only letters and Numbers are allowed" }

	validates :first_name,presence: true, format: { with: /\A[a-zA-Z]+\z/,message: "Only letters are allowed" }
    validates :last_name,presence: true, format: { with: /\A[a-zA-Z]+\z/,message: "Only letters are allowed" }

    def self.quotes
    	quotes = ["Labour was the first price, the original purchase - money that was paid for all things. It was not by gold or by silver, but by labour, that all wealth of the world was originally purchased - Adam Smith", 
    		"Science is the great antidote to the poison of enthusiasm and superstition - Adam Smith", "Science is the great antidote to the poison of enthusiasm and superstition - Adam Smith", 
    		"This is one of those cases in which the imagination is baffled by the facts - Adam Smith", 
    		"Capitalism is the astounding belief that the most wickedest of men will do the most wickedest of things for the greatest good of everyone - John Maynard Keynes", 
    		"By a continuing process of inflation, government can confiscate, secretly and unobserved, an important part of the wealth of their citizens - John Maynard Keynes", 
    		"The only relevant test of the validity of a hypothesis is comparison of prediction with experience.- Milton Friedman"]

    	random_quote = quotes.sample
    	return random_quote
    end 	 
end
