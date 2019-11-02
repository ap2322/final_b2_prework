FactoryBot.define do
  factory :course do
    sequence :course_name {|i| "Hella Programming #{i}" }
  end

  trait :with_course_students do
    transient do
      cs_count { 10 }
    end
    after(:create) do |course, evaluator|
      course.course_students << create_list(:course_student, evaluator.cs_count)
    end
  end

  # trait :with_students do
  #   transient do
  #     student_count { 15 }
  #   end
  #   after(:create) do |course, evaluator|
  #     grade = 80
  #     course_student = create :course_student, grade: grade
  #     course.students << create_list(:student, evaluator.student_count, course_student: course_student)
  #     grade += 1
  #   end
  # end
#
#   factory :post do
#   after :create do |post|
#     create :theme, post: post             # has_one
#     create_list :comment, 3, post: post   # has_many
#   end
# end
end
