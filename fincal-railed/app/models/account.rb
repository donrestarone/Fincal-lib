class Account < ApplicationRecord
	validates :name, length: {in: 4..20}, presence: true, uniqueness: true
	validates :category, presence: true
end


# create_table "accounts", force: :cascade do |t|
#     t.string "name"
#     t.string "category"
#     t.float "balance"
#     t.float "interest"
#     t.integer "compounding_frequency"
#     t.integer "compounding_periods"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end
