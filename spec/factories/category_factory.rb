FactoryBot.define do
  factory :category do
    name { "Category Name" }
    details { "Category Details"}
    user
  end
end