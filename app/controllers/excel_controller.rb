class ExcelController < ApplicationController
    def newSheet
        @sheet = CustomerDataSheet.new
    end

    def uploadSheet
        @sheet = CustomerDataSheet.create!(sheet_params)
    
        if @sheet.save
            @sheet.sheet.attach(params[:sheet])
            #CustomerDataEntryJob.perform_later @sheet
            workbook = RubyXL::Parser.parse(@sheet.sheet_path)
            #workbook = RubyXL::Parser.parse(attached[:file])

            #Acquire WorkSheet
            worksheet = workbook[0]
            @cell = worksheet[0][0]

            print(worksheet[0][0])

            customarData = []

            worksheet.each { |row|
                customarData = []
                row.cells.each { |cell|
                    val = cell.value
                    #print(val, '  ->   ')
                    customarData.push(val)

                }
                newCustomar = Customer.new(mobile: customarData[0], name: customarData[1], address: customarData[2])
                newCustomar.save

                #print("\n")
                #print(customarData, "\n")
            }
            
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