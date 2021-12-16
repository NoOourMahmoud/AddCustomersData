class CustomerDataEntryJob < ApplicationJob
  queue_as :default

  def perform(sheett)
    # Do something later
    workbook = RubyXL::Parser.parse(ActiveStorage::Blob.service.send(:path_for, sheett.sheet.key))

    #Acquire WorkSheet
    worksheet = workbook[0]
    @cell = worksheet[0][0]

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
    }
  end
end
