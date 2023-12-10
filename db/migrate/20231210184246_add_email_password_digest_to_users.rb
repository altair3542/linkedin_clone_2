class AddEmailPasswordDigestToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :email, :string
    add_index :users, :email, unique: true
    add_column :users, :password_digest, :string
  end
end
