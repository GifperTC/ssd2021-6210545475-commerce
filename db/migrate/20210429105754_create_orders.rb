class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.belongs_to :product
      t.belongs_to :user
      t.integer :amount, null: false, default: 1
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
