require 'rails_helper'
feature 'Deleting tickets' do
  let!(:project) { FactoryGirl.create(:project) }
  let!(:ticket) { FactoryGirl.create(:ticket, project: project) }
  before do
    visit root_path
    click_link "Sign in"
    fill_in "Email", with: ticket.user.email
    fill_in "Password",with: ticket.user.password
    click_button "Sign in"
    visit '/'
    click_link project.name
    click_link ticket.title
end
  scenario "Deleting a ticket" do
    click_link "Delete Ticket"
    expect(page).to have_content("Ticket has been deleted.")
    expect(page.current_url).to eq(project_url(project))
  end
end