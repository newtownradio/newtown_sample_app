class ChangePriceFloatToDecimal < ActiveRecord::Migration
  def change
    remove_column :products, :price, :float
    add_column :products, :price, :integer
  end
end
