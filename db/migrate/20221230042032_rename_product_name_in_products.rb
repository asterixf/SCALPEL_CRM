class RenameProductNameInProducts < ActiveRecord::Migration[7.0]
  def change
    rename_column(:products, :product_name, :name)
  end
end
