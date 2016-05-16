require 'rails_helper'

describe Product do
	context "when the product has comments" do
		before do
			@product = Product.create!(name: "Race Bike")
            @user = User.create!(:email, :password)
            @product.comments.create!(rating: 1, user: @user, body: "Awful Bike!")
            @product.comments.create!(rating: 3, user: @user, body: "Decent Bike!")
            @product.comments.create!(rating: 5, user: @user, body: "Awesome Bike!")
        end         
end
    it "returns the average rating of all commments" do
	expect(@product.average).to eq "3"
end

   it "is not valid" do
   expect (Product.new(description: "Great App")).not_to be_valid
end

end
