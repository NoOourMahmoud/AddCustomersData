class CustomersSerializer < ActiveModel::Serializer
  attributes :id, :mobile, :name, :address
end
