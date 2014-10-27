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
    flash[:notice] = 'The menu item was successfully created.' if @item.save
    flash[:error] = @item.errors.full_messages.join(", ")
    respond_with(@restaurant, @item)
  end

  def update
    flash[:notice] = 'The menu item was successfully updated.' if @item.update(item_params)
    flash[:error] = @item.errors.full_messages.join(", ")
    respond_with(@restaurant, @item)
  end

  def destroy
    flash[:notice] = 'The menu item was successfully destroyed.' if @item.destroy
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
