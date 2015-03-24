require 'rails_helper'

describe DefinitionsController, type: :controller do
  context "when the definition does not exist in the database" do
    context "when the definition exists in dictionary API" do
      before do
        stub_request(:get, "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/kiwi?key=cab72891-f003-43ef-a983-253666d45082").
          with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.1'}).
          to_return(:status => 200, :body => "<entry><dt>:New Zealand bird</dt><dt>:a resident of New Zealand</dt><dt>:fruit</dt></entry>", :headers => {})
      end

      it "saves definition to the database and returns json containing the definition" do
        expect(Definition.where(word: "kiwi")).to_not exist

        get :show, :id => "kiwi"

        expect(Definition.where(word: "kiwi")).to exist
        expect(response.body).to eq({definitions: ["New Zealand bird", "a resident of New Zealand", "fruit"]}.to_json)
      end
    end

    context "when the definition does not exist in dictionary API" do
      before do
        stub_request(:get, "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/oogle?key=cab72891-f003-43ef-a983-253666d45082").
          with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.1'}).
          to_return(:status => 200, :body => "", :headers => {})
      end

      it "returns an empty json object" do
        get :show, :id => "oogle"

        expect(Definition.where(word: "oogle")).to_not exist
        expect(response.body).to eq({definitions: []}.to_json)
      end
    end
  end

  context "when definition already exists in the database" do
    let!(:definition) { FactoryGirl.create(:definition, word: "doogle", meaning: "jessica") }

    it "returns json containing the definition from the database" do
      expect(Definition.where(word: "doogle")).to exist

      get :show, :id => "doogle"

      expect(response.body).to eq({definitions: ["jessica"]}.to_json)
    end
  end
end
