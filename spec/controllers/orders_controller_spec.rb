require 'rails_helper'

describe OrdersController, :type => :controller do

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

  it "show correct order details" do
    get :index, id: @user
    expect(response).to respond_with @order
  end

  it "saves correct order details" do
    post :show, id: @user
    expect(response).to have_http_status(200)
  end

  it "updates correct order details" do
    update :create, id: @order
    expect(response).to respond_with @order
  end

  it "destroys correct order details" do
    delete :destroy, id: @user
    expect(response).to have_http_status(200)
  end

  context "No user is logged in" do
    it "redirects_to login" do
    get :sign_in, id: @user
    expect(response).to params.require(:order).permit(:product_id, :user_id, :total)
  end
  end
end


