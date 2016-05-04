class AddFileUidToSpreadsheets < ActiveRecord::Migration
  def change
    add_column :spreadsheets, :file_uid, :string
  end
end
