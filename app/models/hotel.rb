class Hotel < ActiveRecord::Base
  has_many :grades, inverse_of: :hotel
  has_one :address, inverse_of: :hotel
  validates :title, presence: true
  validates_associated :grades

  accepts_nested_attributes_for :grades, :address
end
