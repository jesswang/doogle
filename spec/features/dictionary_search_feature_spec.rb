require 'rails_helper'

describe "dictionary search", js: true do
  before do
    stub_request(:get, "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/kiwi?key=cab72891-f003-43ef-a983-253666d45082").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.1'}).
      to_return(:status => 200, :body => "<entry><dt>:New Zealand bird</dt><dt>:a resident of New Zealand</dt><dt>:fruit</dt></entry>", :headers => {})
  end

  it "displays definition(s) for valid search" do
    visit root_path
    fill_in 'search-bar', :with => 'kiwi'
    click_button 'Doogle Search'
    expect(page).to have_content("a resident of New Zealand")
  end
end