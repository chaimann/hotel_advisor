class Grade < ActiveRecord::Base
  belongs_to :hotel, inverse_of: :grades
  belongs_to :user, inverse_of: :grades
  validates :value, :hotel_id, :user_id, presence: true
end
