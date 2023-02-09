class CreateOnotes < ActiveRecord::Migration[7.0]
  def change
    create_table :onotes do |t|
      t.references :order, null: false, foreign_key: true
      t.text :onote

      t.timestamps
    end
  end
end
