class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :length

      t.timestamps
    end
  end
end
