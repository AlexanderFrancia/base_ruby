class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.text :piption
      t.integer :price

      t.timestamps
    end
  end
end
