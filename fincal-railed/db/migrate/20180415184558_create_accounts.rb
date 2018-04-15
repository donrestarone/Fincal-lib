class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :account_name
      t.string :category
      t.float :balance
      t.float :interest
      t.integer :compounding_frequency
      t.integer :compounding_periods

      t.timestamps
    end
  end
end
