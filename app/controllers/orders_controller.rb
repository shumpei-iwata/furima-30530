class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    # @purchaseaddress = PurchaseAddress.all
  end


  def create
    binding.ply
  end



end
