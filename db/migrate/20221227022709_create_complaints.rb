class CreateComplaints < ActiveRecord::Migration[7.0]
  def change
    create_table :complaints do |t|
      t.references :lead, null: false, foreign_key: true
      t.string :description
      t.string :status

      t.timestamps
    end
  end
end
