class Company < ActiveRecord::Base
  belongs_to :user
  has_many :jobs
  validates :name, :location, :mail, :phone, presence:true

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/no-photo.jpg"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
