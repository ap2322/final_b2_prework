FactoryBot.define do
  factory :student do
    sequence :name {|i| "Sally Student#{i}" }
  end

end
