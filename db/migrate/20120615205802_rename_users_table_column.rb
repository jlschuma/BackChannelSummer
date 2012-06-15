class RenameUsersTableColumn < ActiveRecord::Migration
  def change
    rename_column :users, :confirmationPassword, :password_confirmation
  end
end
