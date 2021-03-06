class User < ActiveRecord::Base
  has_many :grades
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable,
          :rememberable#, :recoverable, :trackable
end
