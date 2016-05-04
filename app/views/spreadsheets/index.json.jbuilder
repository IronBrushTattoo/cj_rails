json.array!(@spreadsheets) do |spreadsheet|
  json.extract! spreadsheet, :id, :index
  json.url spreadsheet_url(spreadsheet, format: :json)
end
