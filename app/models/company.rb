class Company < ActiveRecord::Base
  validates :name, :location, :mail, :phone, presence:true
end
