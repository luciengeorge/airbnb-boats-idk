class RenameTypeinBoatstoCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :boats, :type, :category
  end
end
