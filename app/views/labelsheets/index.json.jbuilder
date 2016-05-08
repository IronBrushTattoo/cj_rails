json.array!(@labelsheets) do |labelsheet|
  json.extract! labelsheet, :id, :days, :file_uid, :file_name
  json.url labelsheet_url(labelsheet, format: :json)
end
