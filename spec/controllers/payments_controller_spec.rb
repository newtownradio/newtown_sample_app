require 'rails_helper'

describe PaymentsController, :type => :controller do

before do
  @product = Product.find(params[:product_id])
  @user = current_user
  token = params[:stripeToken]
  end

  context 'POST #create'
  it "creates a new customer" do
  customer = Stripe::Customer.create(

        :email => params[:stripeEmail],

      )

  charge = Stripe::Charge.create(
    :amount => @product.price,
    :currency => "usd",
    :source => token,
    :description => params[:stripeEmail]
    )

  if charge.paid do
    Order.create(
      :product_id => @product.id,
      :user_id => @user.id,
      :total => @product.price
      )
     UserMailer.payments_email(customer).deliver_now
   end
 end

  context Stripe::CardError
    it "The card has been declined" do
     expect(response).to body = e.json_body
     expect(response).to err = body[:error]
     expect(response).to flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
  end

it "redirects_to product_path(@products)" do
    get :show, id: @user.id
    expect(response).to notice: "Thank you for your purchase."
  end
end
end
