require 'rails_helper'

feature 'Editing projects' do
	before do
    sign_in_as!(FactoryGirl.create(:admin_user))
  end
  scenario "Updating a project" do
    create(:project, name: "TextMate 2")

    visit root_path
    click_link "TextMate 2"
    click_link "Edit Project"
    fill_in "Name", with: "TextMate 2 beta"
    click_button "Update Project"

    expect(page).to have_content("Project has been updated.")
  end
  def sign_in_as!(user)
    visit root_path
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password",with: user.password
    click_button "Sign in"
  end
end
