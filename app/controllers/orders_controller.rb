class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]
  before_action :bat_item, only: [:create, :index]
  def index
    if set_item.purchase_record
       redirect_to root_path
    end
    @order = Order.new
  
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def bat_item
    if  current_user == @item.user
     redirect_to root_path 
    end
  end



  def order_params
    params.permit(:postal_code, :area_id, :municipality, :address, :building_name, :phone_number, :item_id, :purchase_record_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
