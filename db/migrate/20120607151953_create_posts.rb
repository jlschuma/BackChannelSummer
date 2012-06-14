class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user
      t.text :body
      t.string :email

      t.timestamps
    end
  end
end
