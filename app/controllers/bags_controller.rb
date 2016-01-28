class BagsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_bag, only: [:show, :edit, :update, :destroy]

   respond_to :html

  def index
    @bags = Bag.where(availability: true)
    respond_with(@bags)
  end

  def show
    respond_with(@bag)
  end

  def new
    @bag = Bag.new
    respond_with(@bag)
  end

  def edit
    authorize! :manage, @bag
  end

  def create
    @bag = current_user.bags.new(bag_params)
    @bag.save
    respond_with(@bag)
  end

  def update
    authorize! :manage, @bag
    @bag.update(bag_params)
    respond_with(@bag)
  end

  def destroy
    authorize! :manage, @bag
    @bag.destroy
    respond_with(@bag)
  end

  private
    def set_bag
      @bag = Bag.friendly.find(params[:id])
    end

    def bag_params
      params.require(:bag).permit(:name, :author, :description, :price, :availability, :image, :resource)
    end
end