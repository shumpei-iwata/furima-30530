class OrdersController < ApplicationController

  def index
     @order = Order.new
    @item = Item.find(params[:item_id])
  
  end


  def create
    @order = Order.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

private
  def order_params 
 params.permit(:postal_code, :area_id, :municipality, :address, :building_name, :phone_number, :item_id, :purchase_record_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item.price,  
        card: order_params[:token],    
        currency: 'jpy'                 
      )
  end
end
