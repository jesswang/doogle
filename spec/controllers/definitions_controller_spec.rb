require 'rails_helper'

RSpec.describe DefinitionsController, type: :controller do
  describe "GET #definitions" do
    it "gets successful response and renders the show template" do
      get :show, :id => "kiwi"
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "#show" do
    it "returns a JSON object if valid word" do
      get :show, :id => "stork"
      expect(JSON.parse(response.body)["definitions"].length).to eq(2)
    end

    it "makes a request to dictionary API if the word doesn't exist in the database" do
      stubs = Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get("http://www.dictionaryapi.com/api/v1/references/collegiate/xml/scintillating?key=cab72891-f003-43ef-a983-253666d45082"){ |env| [304, {}, ''] }
      end
      get :show, :id => "scintillating"
      stubs.verify_stubbed_calls
    end

    it "returns an empty JSON object if word doesn't exist in dictionary API or database" do
      get :show, :id => "wieolks"
      expect(JSON.parse(response.body)["definitions"].length).to eq(0)
    end
  end
end
