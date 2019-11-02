class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :maker
      t.integer :price
      t.string :image
      t.text :outline

      t.timestamps
    end
  end
end
