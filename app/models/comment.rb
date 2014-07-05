class Comment < ActiveRecord::Base
  belongs_to :grade
  belongs_to :hotel
  belongs_to :user

  validates :content, presence: true, length: { maximum: 140 }
  validates :hotel_id, presence: true
  validates_presence_of :grade
end
