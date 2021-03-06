class ChargesController < ApplicationController
  respond_to :html, :js

  def create
   customer = Stripe::Customer.create(
     :email => 'example@stripe.com',
     :card => params[:stripeToken]
   )
   @charge = Charge.new(
   price: params[:charge][:price].to_i,
   user_id: current_user.id,
   vendor_id: params[:charge][:vendor_id].to_i,
   description: params[:charge][:description],
   token: params[:charge][:stripeToken],
   customer_id: customer.id
   )
   if @charge.save
   end
 end

 def update
   @charge = Charge.find(params[:id])
 end
end
