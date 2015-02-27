require 'rails_helper'

RSpec.describe DefinitionsController, type: :controller do
  describe "GET #definitions" do
    it "gets successful response and renders the show template" do
      get :show, :id => "kiwi"
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("show")
    end
  end
end
