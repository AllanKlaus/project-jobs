class Job < ActiveRecord::Base
  belongs_to :category
  belongs_to :company
  validates :title, :description, :location, :category_id, :company_id, presence:true

  def expired?
    updated_at <= 90.days.ago
  end
end
