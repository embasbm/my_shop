class CreatePricingRules < ActiveRecord::Migration[5.2]
  def change
    create_table :pricing_rules do |t|
      t.references :product, foreign_key: true
      t.integer :count
      t.decimal :price

      t.timestamps
    end
  end
end
