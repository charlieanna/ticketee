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
  
  factory :user do
    email "e@e.com"
    name "Ankur"
    password "aaaaaa"
    password_confirmation "aaaaaa"
  end
end
