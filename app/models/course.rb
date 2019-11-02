class Course < ApplicationRecord
  validates_presence_of :course_name

  has_many :course_students
  has_many :students, through: :course_students
end
