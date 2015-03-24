require 'rails_helper'

describe "dictionary search", js: true do
  it "displays definition(s) for valid search" do
    visit root_path
    fill_in 'search-bar', :with => 'kiwi'
    click_button 'Doogle Search'
    expect(page).to have_content("any of a small genus (Apteryx) of flightless New Zealand birds with rudimentary wings, stout legs, a long bill, and grayish brown hairlike plumage")
  end
end