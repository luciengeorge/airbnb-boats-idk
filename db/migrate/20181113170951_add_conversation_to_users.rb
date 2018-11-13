class AddConversationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :conversation, foreign_key: true
  end
end
