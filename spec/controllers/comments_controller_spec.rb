require 'rails_helper'

describe CommentsController, :type => :controller do

before do
@product = Product.create!(name: "Race Bike")
  @user = User.create(email: "test@test.com", password: "password")
  @product.comments.create!(rating: 1, user: @user, body: "Awful Bike")
  end

context "GET #show"
  it "loads correct comment" do
  expect(response).to have_http_status(200)
  expect(response).to format.html { redirect_to @product, notice: 'Review was created successfully.' }
  expect(response).to format.json { render :show, status: :created, location: @product }
  expect(response).to format.js
end
  it "does not load correct comment" do
  expect(response).to have_http_status(200)
  expect(response).to format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
  expect(response).to format.json { render json: @comment.errors, status: :unprocessable_entity }
end

context "destroys #comment"
 it "destroys correct commment" do
 before do
  @comment = Comment.find
  product = @comment.product
  @comment.destroy
  redirect_to @product
  expect(response).to eq have_http_status(200)
  end
 end

  context private
    it def comment_params
  end
end
