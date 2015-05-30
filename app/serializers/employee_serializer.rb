class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :no, :name, :own_coins, :get_coins
end
