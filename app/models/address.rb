class Address < ActiveRecord::Base
  #validates :country, presence: true
  #validates :city, presence: true
  #validates :street, presence: true
  belongs_to :hotel, inverse_of: :address
end
