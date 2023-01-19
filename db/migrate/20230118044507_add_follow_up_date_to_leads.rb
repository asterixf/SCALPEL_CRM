class AddFollowUpDateToLeads < ActiveRecord::Migration[7.0]
  def change
    add_column :leads, :follow_up_date, :date
    add_column :leads, :follow_up_time, :time
  end
end
