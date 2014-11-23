class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_url
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end