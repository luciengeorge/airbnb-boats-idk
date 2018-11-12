class AddAvailableToBoats < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :available, :boolean, default: true
  end
end
