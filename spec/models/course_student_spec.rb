require 'rails_helper'

describe CourseStudent type: :model do
  describe 'validations' do
    it { should validate_presence_of :student_id}
    it { should validate_presence_of :course_id}
    it { should validate_presence_of :grade}
  end

  describe 'relationships' do
    it { should belong_to :students }
    it { should belong_to :courses }
  end
end
