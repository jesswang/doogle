require 'rails_helper'

describe DefinitionsController, type: :controller do
  describe "#definitions" do
    it "gets successful response" do
      get :show, :id => "kiwi"
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "calls #makeDictionaryApiRequest when the word is not in the database" do
      expect(controller).to receive(:makeDictionaryApiRequest).with(word: "kiwi")
      get :show, :id => "kiwi"
      # expect(Definition.where(word: "kiwi")).to exist # why doesn't this work
    end

    context "when defintion already exists in the database" do
      let!(:definition) { FactoryGirl.create(:definition, word: "doogle", meaning: "jessica") }

      it "returns json containing the definition for the database" do
        get :show, :id => "doogle"

        expect(response.body).to eq({definitions: ["jessica"]}.to_json)
      end
    end
  end
end
