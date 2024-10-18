class CreateReactions < ActiveRecord::Migration[7.2]
  def change
    create_table :reactions do |t|
      t.references :article, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :kind
      t.string :type
      t.string :comment
      t.string :references

      t.timestamps
    end
  end
end
