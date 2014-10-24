class ItemsController < ApplicationController
  before_action :set_restaurant
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @items = Item.all
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
    @item.save
    respond_with(@restaurant, @item)
  end

  def update
    @item.update(item_params)
    respond_with(@restaurant, @item)
  end

  def destroy
    @item.destroy
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
