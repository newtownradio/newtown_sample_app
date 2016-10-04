require 'rails_helper'

describe ProductsController, :type => :controller do

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

  it "shows correct product details" do
    get :index, id: @user
    expect(response).to redirect_to @product
  end

  it "saves correct product details" do
    post :show, id: @user.admin
    expect(response).to redirect_to @product
  end

  it "updates correct product details" do
    update :create, id: @user.admin
    expect(response).to redirect_to @product
  end

  it "destroys correct product details" do
    delete :destroy, id: @user.admin
    expect(response).to redirect_to @orders
  end

  context "No user is logged in" do
    it "redirects_to login" do
    get :sign_in, id: @user.admin
    expect(response).to redirect_to (new_user_session_path)
  end
  end
end
