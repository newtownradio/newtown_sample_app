require 'rails_helper'

describe Order, :type => :model do

  before do
    @user = FactoryGirl.build(:user, orders: @orders, product: @product)
  end

end
