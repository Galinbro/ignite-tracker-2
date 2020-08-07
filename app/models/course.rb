class Course < ApplicationRecord
  belongs_to :topic
  has_many :user_courses
  has_many :users, through: :user_courses
  
  
  validates :name, presence: true, uniqueness: true
  
end
