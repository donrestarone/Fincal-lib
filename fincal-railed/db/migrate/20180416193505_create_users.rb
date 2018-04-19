class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.string :first_name, null: false, :limit => 10
    	t.string :last_name, null: false, :limit => 10
    	t.string :username, null: false, :limit => 20
    	t.string :email, null: false, :limit=>30
    	t.string :password_digest, null: false
      t.timestamps
    end
  end
end
