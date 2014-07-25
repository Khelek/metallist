class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string  :password_digest
      t.text :first_name
      t.text :last_name
      t.string :state
      t.string :role

      t.timestamps
    end
  end
end
