class RenameNameColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :name, :name_item
  end
end
