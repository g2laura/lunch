class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @restaurants = Restaurant.ordered_by_votes
    respond_with(@restaurants)
  end

  def show
    respond_with(@restaurant)
  end

  def new
    @restaurant = Restaurant.new
    respond_with(@restaurant)
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to action: 'index'
  end

  def update
    @restaurant.update(restaurant_params)
    respond_with(@restaurant)
  end

  def destroy
    @restaurant.destroy
    respond_with(@restaurant)
  end

  def vote
    @restaurant = Restaurant.find(params[:restaurant_id])
    unless current_user.restaurant.id == @restaurant.id
      current_user.update(restaurant: @restaurant)
    end
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :slogan, :phone_number, :email, :address, :image, :twitter, :instagram, :facebook, :website, :delivery, :category_list)
    end
end
