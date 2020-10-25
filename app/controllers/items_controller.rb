class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.mew
  end

  def create
  end
end
