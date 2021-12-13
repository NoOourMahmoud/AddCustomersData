class ExcelController < ApplicationController
    def newSheet
    end

    def uploadSheet
        url = 
        CustomerDataEntryJob.perform_later params[:attachment]
        redirect_to root_path
    end
end