require 'rails_helper'
require 'capybara/rails'

feature 'Person Profile Page' do

  before do
    Person.create!(
      title: "Mr",
      first_name: "Joe",
      last_name: "Example",
    )
  end

  scenario 'Users can click on a persons name and see their profile page' do

    visit root_path

    create_user email: "user@example.com"

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    click_on "Mr Joe Example"
    expect(page).to have_content("Mr Joe Example")
  end

end