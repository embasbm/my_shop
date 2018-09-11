class AddBulkPurchaseToPricingRules < ActiveRecord::Migration[5.2]
  def up
    add_column :pricing_rules, :bulk_purchase, :boolean, default: false
  end

  def down
    remove_column :pricing_rules, :bulk_purchase
  end
end
