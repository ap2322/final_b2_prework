require 'rails_helper'

describe Course do
  describe 'validations' do
    it { should validate_presence_of :course_name }
  end

  describe 'relationships' do
    it { should have_many :course_students }
    it { should have_many(:students).through(:course_students)}
  end
end
