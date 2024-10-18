class RenameTable < ActiveRecord::Migration[7.2]
  def change
    rename_table :countries, :locations
  end
end
