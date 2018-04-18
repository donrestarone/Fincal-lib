class ChangeAccountNametoName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :accounts, :account_name, :name
  end
end
