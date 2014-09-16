require 'rails_helper'

feature 'Creating Tickets' do
  before do
    create(:project, name: "Internet Explorer")
    @user = create(:user)
    visit root_path
    click_link "Sign in"
    fill_in "Email", with: @user.email
    fill_in "Password",with: @user.password
    click_button "Sign in"
    click_link "Internet Explorer"
    click_link "New Ticket"
  end


  scenario "Creating a ticket" do


    fill_in "Title",with: "Non-standards compliance"
    fill_in "Description",with: "My pages are ugly!"
    click_button "Create Ticket"

    within "#ticket #author" do
      expect(page).to have_content "Created by #{@user.email}"
    end
    expect(page).to have_content "Ticket has been created"
  end

  scenario "Creating a ticket without valid attributes fails" do

    click_button "Create Ticket"

    expect(page).to have_content "Ticket has not been created."
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Description can't be blank"
  end

  scenario "Description must be longer than 10 characters" do

    click_button "Create Ticket"
    fill_in "Title", with: 'Non-standards compliance'
    fill_in "Description",with: "it sucks"
    click_button "Create Ticket"

    expect(page).to have_content "Ticket has not been created."
    expect(page).to have_content "Description is too short"
  end
end
