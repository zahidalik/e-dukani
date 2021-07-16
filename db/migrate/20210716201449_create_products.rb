class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :item_name
      t.float :price
      t.integer :available

      t.timestamps
    end
  end
end
