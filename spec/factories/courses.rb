FactoryBot.define do
  factory :course do
    sequence :course_name {|i| "Hella Programming #{i}" }
  end

end
