require 'rails_helper'

feature "Profile page" do
  scenario "viewing" do
    user = create(:user)
    visit user_path(user)
    expect(page).to have_content user.name
    expect(page).to have_content user.email
  end
end

feature "Editing users" do
  scenario "Updating a user" do
    user = create(:user)
    visit user_path(user)
    click_link "Edit Profile"

    fill_in "Email", with: "e@e.com"
    click_button "Update Profile"

    expect(page).to have_content "Profile has been updated."
  end
end
