class ExcelController < ApplicationController
    def newSheet
    end

    def uploadSheet
        CustomerDataEntryJob.perform_later params
        redirect_to root_path
    end
end