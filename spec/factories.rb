FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "John#{i}@gmail.com" }
    sequence(:name)  { |i| "Doe#{i}" }
    sequence(:age)   { |i| 10 + i }
  end
end