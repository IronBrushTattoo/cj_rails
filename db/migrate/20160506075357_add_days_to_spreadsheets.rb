class AddDaysToSpreadsheets < ActiveRecord::Migration
  def change
    add_column :spreadsheets, :days, :integer
  end
end
