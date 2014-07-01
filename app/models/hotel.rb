class Hotel < ActiveRecord::Base
  has_many :grades
  has_one :address
  validates :title, presence: true, length: { maximum: 30 }
  validates :room_description, length: { maximum: 300 }
  validates_associated :grades

  accepts_nested_attributes_for :grades, :address

  def rating
    Grade.where("hotel_id = ?", id).average(:value).to_f
  end

end
