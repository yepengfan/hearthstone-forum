require 'rails_helper'

RSpec.describe ManagementController, type: :controller do

  describe "GET #manage" do
    it "returns http success" do
      get :manage
      expect(response).to have_http_status(:success)
    end
  end

end
