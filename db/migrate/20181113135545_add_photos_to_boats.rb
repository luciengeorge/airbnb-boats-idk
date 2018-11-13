class AddPhotosToBoats < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :photos, :json
  end
end
