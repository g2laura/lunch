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
    flash[:success] = 'The restaurant was successfully created.' if @restaurant.save
    flash[:error] = @restaurant.errors.full_messages.join(", ") unless @restaurant.errors.full_messages.blank?
    redirect_to action: 'index'
  end

  def update
    flash[:success] = 'The restaurant was successfully updated.' if @restaurant.update(restaurant_params)
    flash[:error] = @restaurant.errors.full_messages.join(", ") unless @restaurant.errors.full_messages.blank?
    respond_with(@restaurant)
  end

  def destroy
    flash[:success] = 'The restaurant was successfully destroyed.' if @restaurant.destroy
    respond_with(@restaurant)
  end

  def menu
    @restaurants = Restaurant.all
    respond_with(@restaurants)
  end

  def vote
    @restaurant = Restaurant.find(params[:restaurant_id])
    unless current_user.restaurant == @restaurant
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
