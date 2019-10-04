require 'rails_helper'

RSpec.describe "Scholars", type: :request do
  describe "GET /scholars" do
    it "works! (now write some real specs)" do
      get scholars_path
      expect(response).to have_http_status(200)
    end
  end
end
