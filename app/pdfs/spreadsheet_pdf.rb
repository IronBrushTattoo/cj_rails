class SpreadsheetPdf < Prawn::Document

  def initialize(spreadsheet, view)
    super()
    @spreadsheet = spreadsheet.to_json
    @view = view
    logo
    text "@spreadsheet is of class #{@spreadsheet.class} as #{@spreadsheet}"
  end

  def logo
    logopath = "#{Rails.root}/app/assets/images/logo.png"
    image logopath, :width => 197, :height => 197
  end
  
end
