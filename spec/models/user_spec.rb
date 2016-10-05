require "rails_helper"

describe User, :type => :model do

  before do
    @user = FactoryGirl.create(:user, orders: @orders, product: @product)
  end

  it "creates a successful order" do
    expect(@user).to eq devise(:database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable)
    expect(@user).to eq has_many(:orders)
  end

describe AddAdminFlagToUsers, :type => :model do

  before do
    @user.admin = FactoryGirl.create(:admin)
  end

  it "updates a successful order" do
    expect(@user.admin).to eq def change(add_column)(:admin)
  end

end
end
end

