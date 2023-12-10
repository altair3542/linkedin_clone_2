class AddForeignKeysToConversations < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :conversations, :users, column: :sender_id, primary_key: :id
    add_foreign_key :conversations, :users, column: :recipient_id, primary_key: :id
  end
end
