class Hotel < ActiveRecord::Base
  has_many :grades, inverse_of: :hotel
  has_one :address
  has_many :comments
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: { maximum: 30 }
  validates :room_description, length: { maximum: 300, 
                                        too_long: "%{count} characters is the maximum allowed" }

  accepts_nested_attributes_for :grades, :address
  validates_associated :grades

  def rating
    Grade.where("hotel_id = ?", id).average(:value).to_f.round(2)
  end

end
