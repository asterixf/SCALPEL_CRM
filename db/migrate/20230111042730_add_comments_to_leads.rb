class AddCommentsToLeads < ActiveRecord::Migration[7.0]
  def change
    add_column :leads, :comments, :text
  end
end
