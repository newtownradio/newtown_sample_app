require 'rails_helper'

describe Product do
	context "when the product has coments" do
		before do
			@product = Product.create!(name: "race bike")
            @user = User.create!(:email, :password)
            @product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
        end         

it "returns the average rating of all commments" do
	expect(@product.average).to eq "3"
end

