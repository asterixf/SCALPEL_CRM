class AddUserToOnotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :onotes, :user, foreign_key: true
    rename_column :onotes, :onote, :note
  end
end
