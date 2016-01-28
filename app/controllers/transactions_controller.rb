class TransactionsController < ApplicationController
  def create
  	bag  = Bag.find_by!(slug: params[:slug])
    sale = bag.sales.create(
      amount: bag.price,
          buyer_email: current_user.email,
          seller_email: bag.user.email,
          stripe_token: params[:stripeToken])
       sale.process!

       if sale.finished?
  redirect_to pickup_url(guid: sale.guid), notice: "Transaction Successful"
       else
  redirect_to bag_path(bag), notice: "Something went wrong"
       end
  
end


  def pickup
    @sale = Sale.find_by!(guid: params[:guid])
    @bag = @sale.bag
  end
end