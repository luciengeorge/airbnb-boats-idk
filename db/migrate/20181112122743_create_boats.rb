class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.string :name
      t.text :description
      t.string :location
      t.integer :capacity
      t.integer :length
      t.integer :price_per_week
      t.string :type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
