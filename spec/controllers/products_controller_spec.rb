require 'rails_helper'

describe ProductsController, :type => :controller do

before do
  @user = FactoryGirl.build(:user)
  @user.admin = FactoryGirl.build(:admin)
end

context 'GET #index' do
  it "shows the correct search results" do
  expect(response).to eq search_term = params[:q]
  expect(response).to eq @products = Product.where("name ilike ?", "%#{search_term}%")
  expect(response).to eq @products = Product.all
  expect(response).to eq respond_with @products
  end
end

context 'GET #show' do
  it "shows correct product details" do
    expect(response).to eq @comments = @product.comments.order("created_at DESC").paginate(:page => params[:page],        :per_page => 5)
  end
end

context 'GET #new' do
  it "creates correct product details" do
    expect(response).to eq @product = Product.new
  end
end

context 'POST #create' do
  it "updates correct product details" do
  expect(response).to eq @product = Product.new(product_params)
  expect(response).to eq respond_to do |format|
      if @product.save
        expect(response).to eq format.html { redirect_to "/static_pages/landing_page", notice: 'Product was successfully created.' }
        expect(response).to eq format.json { render :show, status: :created, location: @products }
        expect(response).to eq format.html { render :new }
        expect(response).to eq format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

context 'PATCH #update'
  it "updates correct product details" do
    expect(response).to do |format|
      if @product.update.(product_params)
        expect(response).to eq format.html { redirect_to products_url, notice: 'Product was successfully updated.' }
        expect(response).to eq format.json { render :show, status: :ok, location: @product }
        expect(response).to eq format.html { render :edit }
        expect(response).to eq format.json { render json: @product.errors, status: :unprocessable_entity }
    end
  end

context 'DELETE #destroy'
  it "destroys correct product details" do
    expect(response).to @product.destroy
    respond_to do |format|
      expect(response).to eq format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      expect(response).to eq format.json { head :no_content }
    end
  end

context private
  it "product has params" do
  expect(response).to eq @product = Product.find(params)[:id]
  end

  it "product has permit params" do
    expect(response).to eq params.require(:product).permit(:name, :description, :image_url, :colour, :price)
  end
end
