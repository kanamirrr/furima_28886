class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @item = Item.new(item_params)
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :images).merge(user_id: current_user.id)
  end

end
