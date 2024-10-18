class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.datetime :when
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
