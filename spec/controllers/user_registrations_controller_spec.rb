require 'rails_helper'

describe UserRegistrationsController, :type => :controller do

  before do
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
  end

  describe "GET #show" do
    context "User is logged in" do
    before do
    sign_in @user
    end
  end
  end

  it "loads correct user details" do
    get :registrations, id: @users
      expect(response).to have_http_status(200)
      expect(assigns(:users)).to eq @user
    # expect mailer code
    end

  it "does not load the second user" do
    get :registrations, id: @users
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end

  context "No user is logged in" do
    it "redirects to login" do
      get :registrations, id: @users
        expect(response).to redirect_to (new_user_session_path)
    end
  end

end

