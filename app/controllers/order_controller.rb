class OrderController < ApplicationController
  before_action :set_restaurant

  def create
    @item = Item.find(params[:item_id])
    @message = ""

    if(Item.is_within_budget?(@restaurant, current_user, @item))
      @order = Order.find_or_create_by(restaurant: @restaurant, item: @item, user: current_user)
    else
      @message = Item.within_budget_message(@restaurant, current_user, @item)
    end
    @orders = Order.lunch_by_user(@restaurant, current_user)
    render json: {
      "order" => @order.as_json(include: [:restaurant, :item, :user]),
      "orders" => @orders.as_json(include: [:restaurant, :item, :user]),
      "total" => Item.total_by_user(@restaurant, current_user),
      "message" => @message
    }
  end

  def destroy
    @item = Item.find(params[:item_id])
    @order = Order.find_by(restaurant: @restaurant, item: @item, user: current_user).destroy
    @orders = Order.lunch_by_user(@restaurant, current_user)
    render json: {
      "orders" => @orders.as_json(include: [:restaurant, :item, :user]),
      "total" => Item.total_by_user(@restaurant, current_user)
    }
  end

  def user_orders
    @orders = Order.lunch_by_user(@restaurant, current_user)
    render json: @orders
  end

  def restaurant_orders
    @orders = Order.lunch_by_restaurant_and_office(@restaurant, current_user.office)
    @total = Item.total_by_restaurant_and_office(@restaurant, current_user.office)
    respond_to do |format|
      format.pdf do
        pdf = LunchPdf.new(@orders, @total)
        send_data pdf.render, filename: 'lunch.pdf', type: 'application/pdf'
      end
    end
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
end
