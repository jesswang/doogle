require 'rails_helper'

RSpec.describe DefinitionsController, type: :controller do
  describe "GET #definitions" do
    it "gets successful response" do
      get :show
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
