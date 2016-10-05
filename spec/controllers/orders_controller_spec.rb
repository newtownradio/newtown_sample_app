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

context 'GET #index, id: @user'
  it "show correct order details" do
    expect(response).to have_http_status(200)
  end

context 'post #show, id: @user'
  it "saves correct order details" do
    expect(response).to have_http_status(200)
  end

context 'update #create, id: @order'
  it "updates correct order details" do
    expect(response).to have_http_status(200)
  end

context 'delete #destroy, id: @user'
  it "destroys correct order details" do
    expect(response).to have_http_status(200)
  end

  context 'get #sign_in, id: @user'
    it "redirects_to login" do
    expect(response).to require(:order).permit(:product_id, :user_id, :total)
    expect(response).to have_http_status(200)
  end
end


