require 'rails_helper'

describe Order, :type => :model do

  before do
    @user = FactoryGirl.create(:user, orders: @orders, product: @product)
  end

  it "creates a successful order" do
    expect(response).to eq orders: @orders
    expect(response).to eq have_http_status(200)
  end

end
