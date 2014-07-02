class Hotel < ActiveRecord::Base
  has_many :grades
  has_one :address
  has_many :comments
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: { maximum: 30 }
  validates :room_description, length: { maximum: 300 }

  accepts_nested_attributes_for :grades, :address

  def rating
    Grade.where("hotel_id = ?", id).average(:value).to_f.round(2)
  end

end
