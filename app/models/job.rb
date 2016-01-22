class Job < ActiveRecord::Base
  belongs_to :category
  belongs_to :company
  validates :title, :description, :location, :category_id, :company_id, presence:true
end
