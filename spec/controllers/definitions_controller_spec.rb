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

    it "returns an empty JSON object if word doesn't exist in dictionary API or database" do
      get :show, :id => "wieolks"
      expect(JSON.parse(response.body)["definitions"].length).to eq(0)
    end
  end
end
