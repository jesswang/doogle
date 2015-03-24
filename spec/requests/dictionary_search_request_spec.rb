require 'rails_helper'

RSpec.describe "dictionary API search request", :type => :request do
  before do
    stub_request(:get, "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/peach?key=cab72891-f003-43ef-a983-253666d45082").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.1'}).
      to_return(:status => 200, :body => "", :headers => {})
  end

  it "stubs the request with WebMock" do
    get '/definitions/peach'
    expect(WebMock).to have_requested(:get, "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/peach?key=cab72891-f003-43ef-a983-253666d45082")
  end
end