class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable
  enum user_type: { visitor: 0 , student: 1 }
  validates :user_type, presence: true
  has_one :person
  has_many :visits
end
