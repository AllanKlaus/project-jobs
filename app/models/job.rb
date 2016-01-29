class Job < ActiveRecord::Base
  DAYS_EXPIRED = 90
  CONTRACT_TYPE = ['CLT', 'PJ', 'Freelancer']
  belongs_to :category
  belongs_to :company
  validates :title, :description, :location, :category_id, :company_id, presence:true

  def expired?
    Time.zone.now >= (updated_at + DAYS_EXPIRED.days)
  end
end
