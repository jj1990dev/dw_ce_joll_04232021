class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :sku
      t.float :total
      t.timestamps
    end
  end
end
