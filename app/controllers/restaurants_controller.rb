class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json
  load_and_authorize_resource except: [:create, :vote]

  def index
    @restaurants = Restaurant.ordered_by_votes_and_office(current_user.office)
    @votes = Restaurant.votes_by_office(current_user.office)
    respond_with(@restaurants, "votes" => @votes)
  end

  def show
    @items_by_user = Order.lunch_by_user(@restaurant, current_user)
    @total = Item.total_by_user(@restaurant, current_user)
    @votes = Restaurant.votes_by_restaurant_and_office(@restaurant, current_user.office)
    respond_with(@restaurant, @total, @items_by_user, "votes" => @votes)
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
    current_user.update(restaurant: @restaurant)
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :slogan, :phone_number, :email, :address, :image, :twitter, :instagram, :facebook, :website, :delivery, :category_list)
    end
end
