require 'rails_helper'

RSpec.describe DefinitionsController, type: :controller do
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

    it "calls #retrieveRecordFromDatabase when the word exists in the database" do
      Definition.create(word: "kiwi", meaning: "fruit")
      expect(controller).to receive(:retrieveRecordFromDatabase).with(word: "kiwi")
      get :show, :id => "kiwi"
    end
  end
end
