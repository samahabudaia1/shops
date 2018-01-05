class AddCostToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :cost_in_cents, :string
    add_column :products, :decimal, :string
  end
end
