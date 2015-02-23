require "rails_helper"

describe "initial view" do
  it "displays blank search bar and no results" do
    visit '/'
    expect(page).to have_selector("input", text: "")
    expect(page).to have_selector("#search-results", text: "")
  end
end

describe "dictionary search" do
  it "displays definition(s) for valid search" do
    visit '/'
    fill_in 'search-bar', :with => 'poodle'
    click_button 'search-button'
    expect(page).to have_selector("li")
  end
end