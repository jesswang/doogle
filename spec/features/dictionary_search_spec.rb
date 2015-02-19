require "rails_helper"

describe "initial view" do
  it "displays blank search bar and no results" do
    visit '/'
    expect(page).to have_selector("input", text: "")
    expect(page).to have_selector("#search-results", text: "")
  end
end