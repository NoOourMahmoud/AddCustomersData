class ExcelController < ApplicationController
  def newSheet
    @sheet = CustomerDataSheet.new
  end

  def uploadSheet
    @sheet = CustomerDataSheet.new(sheet_params)

    if @sheet.save
      CustomerDataEntryJob.perform_later @sheet
      redirect_to root_path , notice: "Successfully uploaded"
    else
      render :newSheet
    end 
  end


  private
  def sheet_params
    params.require(:customer_data_sheet).permit(:sheet)
  end
end