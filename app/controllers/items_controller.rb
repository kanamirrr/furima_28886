class ItemsController < ApplicationController
  before_action :move_to_signin, except: [:index]

  def index
    # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduce, :category_id, :condition_id, :postage_payer_id, :prefecture_code_id, :preparation_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_signin
    redirect_to user_session_path unless user_signed_in?
  end
end
