class ChangePricePrecission < ActiveRecord::Migration[5.2]
  def change
    change_column :pricing_rules, :price, :decimal, precision: 5, scale: 2
    change_column :products, :price, :decimal, precision: 5, scale: 2
  end
end
