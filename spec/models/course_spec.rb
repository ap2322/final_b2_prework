require 'rails_helper'

describe Course do
  describe 'validations' do
    it { should validate_presence_of :course_name }
  end

  describe 'relationships' do
    it { should have_many :course_students }
    it { should have_many(:students).through(:course_students)}
  end

  describe 'instance methods' do
    before(:each) do
       @course_1 = create(:course, :with_course_students)
       @student_a = Student.create!(name: 'Student A')
       @course_student_a = CourseStudent.create!(student_id: @student_a.id, course_id: @course_1.id, grade: 90)
    end

    it 'finds a student_grade for the course' do
      expect(@course_1.student_grade(@student_a.id)).to eq 90
    end
  end

end
