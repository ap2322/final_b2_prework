class Course < ApplicationRecord
  validates_presence_of :course_name

  has_many :course_students
  has_many :students, through: :course_students

  def student_grade(student_id)
    course_students.find_by(student_id: student_id).grade
  end
end
