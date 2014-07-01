class Grade < ActiveRecord::Base
  belongs_to :hotel
  belongs_to :user
  has_one :comment
  validates :value, presence: true, inclusion: { in: 1..5 }
  #validates :hotel_id, :user_id, presence: true

  accepts_nested_attributes_for :comment
end
