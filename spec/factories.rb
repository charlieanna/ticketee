FactoryGirl.define do
  factory :project do
    name "Example Project"

  end

  factory :ticket do
    title "Title"
    description "Description"
    project
    user
  end

 FactoryGirl.define do
  sequence(:email) {|n| "user#{n}@example.com" }
  factory :user do
    name "username"
    email { generate(:email) }
    password "hunter2"
    factory :admin_user do
      admin true
    end
  end
end
end
