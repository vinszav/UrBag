class PagesController < ApplicationController
  
  before_action :authenticate_user!, only: [:dashboard]

  def home
  	if current_user 
  		redirect_to bags_path
  end
end

def dashboard
	@bags = current_user.bags
	@purchased = Sale.where(buyer_email: current_user.email)
    @sales = Sale.where(seller_email: current_user.email)
	end
end
