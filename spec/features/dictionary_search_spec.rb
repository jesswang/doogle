require 'rails_helper'

describe "dictionary search", js: true do
  it "displays definition(s) for valid search" do
    visit root_path
    fill_in 'search-bar', :with => 'kiwi'
    click_button 'search-button'
    expect(page).to have_selector("li")
  end
end