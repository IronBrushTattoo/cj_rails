class LabelsheetsController < SecuredController
  before_action :set_labelsheet, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_using_omniauth?, only: [:new, :edit, :update, :destroy]

  def index
    @labelsheets = Labelsheet.all
  end

  def show
    @labelsheet = Labelsheet.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = LabelsheetPdf.new(@labelsheet, view_context)
        send_data pdf.render,
                  filename: "labelsheet_#{@labelsheet.created_at.strftime("%d/%m/%Y")}.pdf",
                  type: "application/pdf",
                  disposition: "inline"
      end
    end
  end

  def new
    @labelsheet = Labelsheet.new
  end

  def edit
  end

  def create
    @labelsheet = Labelsheet.new(labelsheet_params)

    respond_to do |format|
      if @labelsheet.save
        format.pdf { render :pdf => "show" }
        format.html { redirect_to @labelsheet, notice: 'Labelsheet was successfully created.' }
        format.json { render :show, status: :created, location: @labelsheet }
      else
        format.html { render :new }
        format.json { render json: @labelsheet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @labelsheet.update(labelsheet_params)
        format.html { redirect_to @labelsheet, notice: 'Labelsheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @labelsheet }
      else
        format.html { render :edit }
        format.json { render json: @labelsheet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @labelsheet.destroy
    respond_to do |format|
      format.html { redirect_to labelsheets_url, notice: 'Labelsheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_labelsheet
    @labelsheet = Labelsheet.find(params[:id])
  end

  def labelsheet_params
    params.require(:labelsheet).permit(:index, :file, :days)
  end
end
