require 'capybara/rspec'
require './app'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe("adding a new list", {:type => :feature}) do
  it ("allows a user to add a new list and view tasks") do
    visit('/')
    click_link('Add a list')
    fill_in('list_name', :with => 'Professional Stuff')
    click_button('Add List')
    expect(page).to have_content('Professional Stuff')
  end
end
