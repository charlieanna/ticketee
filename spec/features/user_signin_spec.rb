require 'rails_helper'

feature "signing in"  do
  scenario "Signing in via form" do
    user = create(:user)

    visit root_path
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password",with: user.password
    click_button "Sign in"

    expect(page).to have_content "Signed in successfully."
  end
end
