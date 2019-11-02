FactoryBot.define do
  factory :student do
    sequence :name {|i| "Sally Student#{i}" }
  end

  trait :with_courses do
    transient do
      cs_count { 1 }
    end
    after(:create) do |student, evaluator|
      student.course_students << create_list(:course_student, evaluator.cs_count)
    end
  end


  # trait :with_courses do
  #   transient do
  #     course_count { 3 }
  #   end
  #
  #   after(:create) do |student, evaluator|
  #     grade = 80
  #     create :course_student, grade: grade
  #     binding.pry
  #     student.course_students << create_list(:course_student, evaluator.course_count, grade: grade)
  #     grade += 1
  #   end
  # end

end
