FactoryBot.define do
  factory :course_student do
    sequence :grade {|i| 80+i }

    student
    course
  end

  FactoryBot.rewind_sequences

end
