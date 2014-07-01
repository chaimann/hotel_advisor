class Grade < ActiveRecord::Base
  belongs_to :hotel
  belongs_to :user
  validates :value, presence: true, inclusion: { in: 1..5 }
  #validates :hotel_id, :user_id, presence: true
end
