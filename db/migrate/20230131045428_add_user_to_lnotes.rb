class AddUserToLnotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :lnotes, :user, foreign_key: true
  end
end
