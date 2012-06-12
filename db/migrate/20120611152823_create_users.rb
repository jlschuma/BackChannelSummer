class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :confirmationPassword
      t.string :token
      t.boolean :isAdmin

      t.timestamps
    end
  end
end
