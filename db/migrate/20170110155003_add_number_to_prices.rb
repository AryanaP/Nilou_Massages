class AddNumberToPrices < ActiveRecord::Migration[5.0]
  def change
    add_column :prices, :number, :integer
  end
end
