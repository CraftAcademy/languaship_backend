FactoryBot.define do
  factory :user do
    password "password1"
    password_confirmation "password1"
    age 14
    gender "Male"
    image "http://cdn2.ubergizmo.com/wp-content/uploads/2016/02/homer-simpson.jpeg"

    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "email#{n}@email.com" }
  end
end
