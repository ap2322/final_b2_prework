require 'rails_helper'

describe 'on the student show page /students/studentid' do
  describe 'as a user' do
    before(:each) do
      @student = create(:student, :with_course_students, cs_count: 3, name: "Wiz Kid")
      @courses = @student.courses
    end

    after(:all) do
      CourseStudent.all.delete_all
      Course.all.delete_all
      Student.all.delete_all
    end

    it 'I see the student name, courses, and grades for each course' do
      visit "/students/#{@student.id}"

      expect(page).to have_content("Wiz Kid")

      @courses.each do |course|
        within "#course-#{course.id}" do
          expect(page).to have_content(course.course_name)
          expect(page).to have_content(course.student_grade(@student.id))
        end
      end
    end
  end
end
