class User < ApplicationRecord
	has_many :accounts
	
	has_secure_password

	PASSWORD_FORMAT = /\A
	  (?=.{8,})          # Must contain 8 or more characters
	  (?=.*\d)           # Must contain a digit
	  (?=.*[a-z])        # Must contain a lower case character
	  (?=.*[A-Z])        # Must contain an upper case character
	  (?=.*[[:^alnum:]]) # Must contain a symbol
	/x

	validates :password, presence: true, length: {:within => 6..40}, format: { with: PASSWORD_FORMAT }, confirmation: true, on: :create 
	validates :password, allow_nil: true, length: {:within => 6..40}, format: { with: PASSWORD_FORMAT }, confirmation: true, on: :update

	validates :email, presence: true, uniqueness: true
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

	validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\z/,message: "Only letters and Numbers are allowed" }

	validates :first_name,presence: true, format: { with: /\A[a-zA-Z]+\z/,message: "Only letters are allowed" }
    validates :last_name,presence: true, format: { with: /\A[a-zA-Z]+\z/,message: "Only letters are allowed" }
end
