require 'rails_helper'

feature 'Deleting projects' do
  scenario "Deleting a project" do
    create(:project, name: "TextMate 2")

    visit root_path
    click_link "TextMate 2"
    click_link "Delete Project"

    expect(page).to have_content "Project has been destroyed"
    expect(page).not_to have_content "TextMate 2"
  end
end
