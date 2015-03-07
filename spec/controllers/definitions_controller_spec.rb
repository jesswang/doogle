require 'rails_helper'

RSpec.describe DefinitionsController, type: :controller do
  describe "GET #definitions" do
    it "gets successful response and renders the show template" do
      stub_request(:get, "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/kiwi?key=cab72891-f003-43ef-a983-253666d45082").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.1'}).
        to_return(:status => 200, :body => "", :headers => {})
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
