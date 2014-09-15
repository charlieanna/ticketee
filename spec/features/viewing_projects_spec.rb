require 'rails_helper'

feature 'Viewing projects' do
  scenario 'Listing all projects' do
    create(:project, name: 'TextMate 2')
    visit root_path
    expect(page).to have_css 'ul.projects', text: 'TextMate 2'
  end
end
