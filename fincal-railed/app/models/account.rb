class Account < ApplicationRecord
	validates :name, length: {in: 4..40}, presence: true, uniqueness: true
	validates :category, presence: true
end

