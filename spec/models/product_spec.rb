require 'rails_helper'

describe Product, type: :model do
 before do
   @product = Product.create!(name: "Race Bike")
   @user = User.create(email: "test@test.com", password: "password")
   @product.comments.create!(rating: 1, user: @user, body: "Awful Bike")
   @product.comments.create!(rating: 3, user: @user, body: "Decent Bike")
   @product.comments.create!(rating: 5, user: @user, body: "Awesome Bike!")
 end

 it "returns the average rating of all comments" do
   expect(@product.average_rating).to eq 3
 end

 it "is not valid" do
   expect(Product.new(description: "Great bike")).to_not be_valid
 end

end
