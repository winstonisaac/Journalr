FactoryBot.define do
  factory :task do
    name { "Task Name" }
    details { "Task Details"}
    deadline { Date.today}
    is_finished { false }
  end
end