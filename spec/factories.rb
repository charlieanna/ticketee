FactoryGirl.define do
  factory :project do
    name "Example Project"
    
  end

  factory :ticket do
    project
  end
end
