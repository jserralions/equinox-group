require 'rails_helper'

RSpec.describe AdminController, type: :controller do

  describe "GET #users" do
    it "redirects nonadmin user" do
      get :users
      response.should redirect_to root_path
    end
  end

end
