class RenameTypeToReactionTypeInReactions < ActiveRecord::Migration[7.2]
  def change
    rename_column :reactions, :type, :reaction_type
  end
end
