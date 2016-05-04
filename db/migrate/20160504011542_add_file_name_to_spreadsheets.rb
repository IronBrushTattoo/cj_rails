class AddFileNameToSpreadsheets < ActiveRecord::Migration
  def change
    add_column :spreadsheets, :file_name, :string
  end
end
