class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    load_items
  end

  def new
    build_item
  end

  def create
    build_item
    save_item or render 'new'
  end

  private

  def load_items
    @items ||= item_scope.to_a
  end

  def build_item
    @item ||= item_scope.build
    @item.attributes = item_params
  end

  def save_item
    if @item.save
      redirect_to items_url
    end
  end

  def item_params
    item_params = params[:item]
    item_params ? item_params.permit(:name) : {}
  end

  def item_scope
    Item.all
  end
end