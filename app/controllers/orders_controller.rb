class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  
  end


  def create
    @order = Order.new(order_params)
    if @order.valid?

      @order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

private
  def order_params 
 params.permit(:postal_code, :area_id, :municipality, :address, :building_name, :phone_number, :item_id, :purchase_record_id).merge(user_id: current_user.id)
  end
end
