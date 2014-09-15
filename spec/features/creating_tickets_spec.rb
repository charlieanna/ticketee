require 'rails_helper'

feature 'Creating Tickets' do
  

  scenario "Creating a ticket" do
    create(:project, name: "Internet Explorer")

    visit root_path
    click_link "Internet Explorer"
    click_link "New Ticket"
    fill_in "Title",with: "Non-standards compliance"
    fill_in "Description",with: "My pages are ugly!"
    click_button "Create Ticket"

    expect(page).to have_content "Ticket has been created"
  end

  scenario "Creating a ticket without valid attributes fails" do
    create(:project, name: "Internet Explorer")

    visit root_path
    click_link "Internet Explorer"
    click_link "New Ticket"
    click_button "Create Ticket"

    expect(page).to have_content "Ticket has not been created."
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Description can't be blank"
  end

  scenario "Description must be longer than 10 characters" do
    create(:project, name: "Internet Explorer")

    visit root_path
    click_link "Internet Explorer"
    click_link "New Ticket"
    click_button "Create Ticket"
    fill_in "Title", with: 'Non-standards compliance'
    fill_in "Description",with: "it sucks"
    click_button "Create Ticket"

    expect(page).to have_content "Ticket has not been created."
    expect(page).to have_content "Description is too short"
  end
end
