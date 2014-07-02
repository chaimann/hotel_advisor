class Comment < ActiveRecord::Base
  belongs_to :grade
  belongs_to :hotel
  belongs_to :user

  validates :content, presence: true
end
