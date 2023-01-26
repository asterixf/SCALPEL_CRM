class CreateLnotes < ActiveRecord::Migration[7.0]
  def change
    create_table :lnotes do |t|
      t.references :lead, null: false, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
