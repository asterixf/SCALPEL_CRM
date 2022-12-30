class ChangePhoneNumberInCustomersToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :customers, :phone_number, :string
  end
end
