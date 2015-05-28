class Employee < ActiveRecord::Base
	validates_presence_of :name, :no
	validates :no , uniqueness: true
end
