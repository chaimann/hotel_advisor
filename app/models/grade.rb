class Grade < ActiveRecord::Base
  belongs_to :hotel
  belongs_to :user
  has_one :comment
  validates :value, presence: true, inclusion: { in: 1..5, message: "must be in the range from 1 to 5" }
  validates :user_id, presence: true
  validates_presence_of :user
  validates_presence_of :hotel
  validates_uniqueness_of :hotel_id, scope: :user_id

  accepts_nested_attributes_for :comment
end
