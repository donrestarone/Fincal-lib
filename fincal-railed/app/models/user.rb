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
end
