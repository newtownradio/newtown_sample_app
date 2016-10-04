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

  it "saves correct comments details" do
    post :comments, id: :products
    expect(response).to redirect_to @product
  end


  it "destroys correct comments details" do
    post :comments, id: @users
    expect(response).to redirect_to @product
  end

  context "No user is logged in" do
    it "redirects_to login" do
    post :sign_out, id: @users
    expect(response).to redirect_to (new_user_session_path)
  end
  end

end
