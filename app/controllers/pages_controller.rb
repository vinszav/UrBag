class PagesController < ApplicationController
  
  before_action :authenticate_user!, only: [:dashboard]

  def home
  	if current_user 
  		redirect_to bags_path
  end
end

def dashboard
	@bags = current_user.bags
	end
end
