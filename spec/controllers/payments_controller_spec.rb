require 'rails_helper'

describe PaymentsController, :type => :controller do

before do
  @user = FactoryGirl.create(:user)
  @user.admin = FactoryGirl.create(:admin)
  end

describe 'GET #index, POST #show, UPDATE #create DELETE #destroy' do
  context 'User is logged in' do
  before do
  sign_in@user
  end
  end
  end

  it "shows correct payment details" do
    get :index, id: @user
    expect(response).to redirect_to @orders
  end

  it "saves correct payment details" do
    post :show, id: @user
    expect(response).to redirect_to @orders
  end

  it "updates correct payment details" do
    update :create, id: @user
    expect(response).to redirect_to @orders
  end

  it "destroys correct order details" do
    delete :destroy, id: @user.admin
    expect(response).to redirect_to @orders
  end

  context "No user is logged in" do
    it "redirects_to login" do
    get :sign_in, id: @user
    expect(response).to redirect_to (new_user_session_path)
  end
  end
end
