class ChangeNameInProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :product_name, :name
  end
end
