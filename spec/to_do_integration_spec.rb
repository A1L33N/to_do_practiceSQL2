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

describe("viewing tasks path") do
  it("allows a user to look at tasks of a list") do
    list = List.new({:name => 'work', :id => nil})
    visit("/list_tasks/#{list.id()}")
    fill_in('new_task', :with => 'send report')
    click_button('Add Task')
    expect(page).to have_content('send report')
  end
end
