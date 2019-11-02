FactoryBot.define do
  trait :with_course_students do
    transient do
      cs_count { 5 }
    end
    after(:create) do |object, evaluator|
      object.course_students << create_list(:course_student, evaluator.cs_count)
    end
  end
end
