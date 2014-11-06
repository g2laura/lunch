class OrderController < ApplicationController
  before_action :set_restaurant

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(restaurant: @restaurant, item: @item, user: current_user)

    if @order.save
      flash[:success] = 'The order was successfully created.'
      render json: @order
    else
      flash[:error] = 'The order wasn\'t created.'
      render json: @order
    end
  end

  def user_orders
    @orders = Order.lunch_by_user(@restaurant, current_user)
    render json: @orders
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
end
