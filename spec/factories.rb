FactoryGirl.define do
  factory :project do
    name "Example Project"
    
  end

  factory :ticket do
  	title "Title"
  	description "Description"
    project
  end
end
