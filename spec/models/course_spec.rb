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
      @course_1 = create(:course)
      @student_a = Student.create!(name: 'Student A')
      @course_student_a = CourseStudent.create!(student_id: @student_a.id, course_id: @course_1.id, grade: 100)
      @student_b = Student.create!(name: 'Student A')
      @course_student_b = CourseStudent.create!(student_id: @student_b.id, course_id: @course_1.id, grade: 60)
      @student_c = Student.create!(name: 'Student A')
      @course_student_c = CourseStudent.create!(student_id: @student_c.id, course_id: @course_1.id, grade: 80)
    end
    after(:all) do
      CourseStudent.all.delete_all
      Course.all.delete_all
      Student.all.delete_all
    end

    it 'finds a student_grade for the course' do
      expect(@course_1.student_grade(@student_a.id)).to eq 100
    end
    
    it 'returns array of all students in a course listed from highest grade to lowest' do
      expected = [@student_a, @student_c, @student_b]
      expect(@course_1.students_grades_descending).to eq expected
    end
  end


end
