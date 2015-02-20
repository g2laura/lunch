class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant
  respond_to :html, :json
  load_and_authorize_resource except: [:create]

  def index
    @items = Item.where(restaurant: @restaurant)
    respond_with(@restaurant, @items)
  end

  def show
    respond_with(@restaurant, @item)
  end

  def new
    @item = Item.new
    respond_with(@restaurant, @item)
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.restaurant = @restaurant
    flash[:success] = 'The menu item was successfully created.' if @item.save
    flash[:error] = @item.errors.full_messages.join(", ") unless @item.errors.full_messages.blank?
    respond_with(@restaurant, @item)
  end

  def update
    @item.restaurant = @restaurant
    flash[:success] = 'The menu item was successfully updated.' if @item.update(item_params)
    flash[:error] = @item.errors.full_messages.join(", ") unless @item.errors.full_messages.blank?
    respond_with(@restaurant, @item)
  end

  def destroy
    flash[:success] = 'The menu item was successfully destroyed.' if @item.destroy
    respond_with(@restaurant, @item)
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end
    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
    def item_params
      params.require(:item).permit(:name, :description, :price, :image, :category_list)
    end
end
