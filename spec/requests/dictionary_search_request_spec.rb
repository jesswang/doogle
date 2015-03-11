require 'rails_helper'

RSpec.describe "dictionary search request", :type => :request do
  # it "returns a JSON object if valid word" do
  #   stub_request(:get, "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/kiwi?key=cab72891-f003-43ef-a983-253666d45082").
  #     with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.1'}).
  #     to_return(:status => 200, :body => "", :headers => {})
  #   expect(WebMock).to have_requested(:get, "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/kiwi?key=cab72891-f003-43ef-a983-253666d45082")
  # end

  # it "makes a request to dictionary API if the word doesn't exist in the database" do
  #   stubs = Faraday::Adapter::Test::Stubs.new do |stub|
  #     stub.get("http://www.dictionaryapi.com/api/v1/references/collegiate/xml/scintillating?key=cab72891-f003-43ef-a983-253666d45082"){ |env| [304, {}, ''] }
  #   end
  #   get :show, :id => "scintillating"
  #   stubs.verify_stubbed_calls
  # end
  #
  # it "returns an empty JSON object if word doesn't exist in dictionary API or database" do
  #   get :show, :id => "wieolks"
  #   expect(JSON.parse(response.body)["definitions"].length).to eq(0)
  # end
end