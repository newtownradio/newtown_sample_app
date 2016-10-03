require 'rails_helper'

describe CommentsController, :type => :controller do

before do
  @user = FactoryGirl.create(:user)
  @user.admin = FactoryGirl.create(:admin)
  end

  describe 'POST #show' do
    context "User is logged in" do
    before do
    sign_in@user
  end
  end
  end

  context "No user is logged in" do
    it "redirects_to login" do
    get :show, id:@user.id
    expect(response).to redirect_to (new_user_session_path)
  end
  end

  context "User is logged in" do
    it "saves correct comment details" do
    post :show, id: @user.id
    expect(response).to redirect_to @product
  end
  end

  it "does not save correct comment details" do
    post :show, id: @user.id
    expect(response).to have_http_status(302)
  end

  it "destroys correct comment details" do
    delete :show, id: @user.admin
    expect(response).to redirect_to @product
  end

end
