class AddInboxToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :inbox, foreign_key: true
  end
end
