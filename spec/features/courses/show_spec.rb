require 'rails_helper'

describe 'On a course show page' do
  before(:each) do
    @course = create(:course, :with_course_students, cs_count: 10, course_name: 'Math')
    @course_2 = create(:course, :with_course_students, cs_count: 1, course_name: 'Decoy')
  end
  after(:all) do
    CourseStudent.all.delete_all
    Course.all.delete_all
    Student.all.delete_all
  end
  describe 'as a user' do
    it 'has the course name and each student in the course listed from highest to lowest' do
      visit "/courses/#{@course.id}"
      expect(page).to have_content('Math')
      expect(page).to_not have_content('Decoy')

      @course.students.each do |student|
        within "#student-#{student.id}" do
          expect(page).to have_content(student.name)
          #following not specified in user story
          expect(page).to have_content(@course.student_grade(student.id))
        end
      end

    end
  end
end
