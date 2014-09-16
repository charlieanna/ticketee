require 'rails_helper'

feature 'Deleting projects' do
	before do
    sign_in_as!(FactoryGirl.create(:admin_user))
  end
  scenario "Deleting a project" do
    create(:project, name: "TextMate 2")

    visit root_path
    click_link "TextMate 2"
    click_link "Delete Project"

    expect(page).to have_content "Project has been destroyed"
    expect(page).not_to have_content "TextMate 2"
  end
  def sign_in_as!(user)
    visit root_path
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password",with: user.password
    click_button "Sign in"
  end
end
