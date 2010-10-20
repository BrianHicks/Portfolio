Factory.define :user do |user|
  user.first_name  { Faker::Name.first_name }
  user.middle_name { Faker::Name.first_name }
  user.last_name   { Faker::Name.last_name }
  user.email       { Faker::Internet.email }
  user.password              "Test123123"
  user.password_confirmation "Test123123"
end
