class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :bat_item, only: [:edit, :destroy]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
  
  end

  def update

    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end 


  private

  def set_item
    @item = Item.find(params[:id])
    
  end

  def bat_item
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:image, :area_id, :day_id, :category_id, :delivery_charge_id, :states_id, :product_name, :description, :price).merge(user_id: current_user.id)
  end
end
