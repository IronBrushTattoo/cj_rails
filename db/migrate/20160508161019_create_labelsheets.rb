class CreateLabelsheets < ActiveRecord::Migration
  def change
    create_table :labelsheets do |t|
      t.integer :days
      t.string :file_uid
      t.string :file_name

      t.timestamps null: false
    end
  end
end
