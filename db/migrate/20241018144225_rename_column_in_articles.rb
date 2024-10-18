class RenameColumnInArticles < ActiveRecord::Migration[7.2]
  def change
    rename_column :articles, :country_id, :location_id
  end
end
