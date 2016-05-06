class SpreadsheetsController < ApplicationController
  before_action :set_spreadsheet, only: [:show, :edit, :update, :destroy]

  def index
    @spreadsheets = Spreadsheet.all
  end

  def show
    @spreadsheet = Spreadsheet.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = SpreadsheetPdf.new(@spreadsheet, view_context)
        send_data pdf.render,
                  filename: "spreadsheet_#{@spreadsheet.created_at.strftime("%d/%m/%Y")}.pdf",
                  type: "application/pdf",
                  disposition: "inline"
      end
    end
  end

  def new
    @spreadsheet = Spreadsheet.new
  end

  def edit
  end

  def create
    @spreadsheet = Spreadsheet.new(spreadsheet_params)

    respond_to do |format|
      if @spreadsheet.save
        format.html { redirect_to @spreadsheet, notice: 'Spreadsheet was successfully created.' }
        format.json { render :show, status: :created, location: @spreadsheet }
      else
        format.html { render :new }
        format.json { render json: @spreadsheet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @spreadsheet.update(spreadsheet_params)
        format.html { redirect_to @spreadsheet, notice: 'Spreadsheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @spreadsheet }
      else
        format.html { render :edit }
        format.json { render json: @spreadsheet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @spreadsheet.destroy
    respond_to do |format|
      format.html { redirect_to spreadsheets_url, notice: 'Spreadsheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_spreadsheet
    @spreadsheet = Spreadsheet.find(params[:id])
  end

  def spreadsheet_params
    params.require(:spreadsheet).permit(:index, :file)
  end
end
