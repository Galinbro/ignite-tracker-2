class Topic < ApplicationRecord
  has_many :courses
  has_many :user_courses
end