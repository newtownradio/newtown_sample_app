require 'rails_helper'

describe CommentsController, :type => :controller do

before do
  @product = FactoryGirl.create(Product.find(params[:product_id]))
  @comment = FactoryGirl.create(@product.comments.new(comment_params))
  @user = FactoryGirl.create(user)
  end

context "GET #{:show}"
  it "loads correct comment" do
  expect(response).to format.html { redirect_to @product, notice: 'Review was created successfully.' }
  expect(response).to format.json { render :show, status: :created, location: @product }
  expect(response).to format.js
end
  it "does not load correct comment" do
  expect(response).to format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
  expect(response).to format.json { render json: @comment.errors, status: :unprocessable_entity }
end

context "destroy #{@comment}"
 it "destroys correct commment" do
  @comment = Comment.find(params[:id])
  product = @comment.product
  @comment.destroy
  redirect_to @product
  end

  context private do
    it def comment_params
  end
end
end
