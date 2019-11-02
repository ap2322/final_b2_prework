class Course < ApplicationRecord
  validates_presence_of :course_name

  has_many :course_students
  has_many :students, through: :course_students

  def student_grade(student_id)
    course_students.find_by(student_id: student_id).grade
  end

  def students_grades_descending
    students.joins(:course_students).order('course_students.grade desc')
  end
end
