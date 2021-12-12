class CustomerDataEntryJob < ApplicationJob
  queue_as :default

  def perform(attached)
    # Do something later
    workbook = RubyXL::Parser.parse(ActiveStorage::Blob.service.path_for(ActiveStorage::Blob.find_by(id: 1).key))
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
  end
end
