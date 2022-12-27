class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :lead, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
