class Transactions_controller < ApplicationController
	def create 
		bag = Bag.find_by!(slug: params[:slug])
  	token = params[:stripeToken] 
  	
    begin 
    
     charge = Stripe::Charge.create(
     	amount: bag.price,
     	currency: "usd",
     	card: token,
     	description: current_user.email)
     
     @sale = bag.sales.create!(buyer_email: current_user.email)
     redirect_to pickup_url(guid: @sale.guid)
     
     rescue Stripe::CardError => e
     
      @error = e
      
      redirect_to bag_path(bag), notice: @error
      
     end
	end

	def pickup
		 @sale = Sale.find_by!(guid: params[:guid])
         @bag = @sale.bag
	end
end 