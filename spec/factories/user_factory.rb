FactoryBot.define do
  factory :user do
    email { "pog@pogger.pog" }
    first_name { "first"} 
    last_name { "last" }
    password { "password" }
    password_confirmation { "password" }
  end
end