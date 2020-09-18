class PurchasersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root

  def index
    @purchaser = Order.new
  end

  def create
    @purchaser = Order.new(purchaser_params)
    if @purchaser.valid?
      pay_item
      @purchaser.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def move_to_root
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def purchaser_params
    params.permit(:token, :post_code, :prefecture_code_id, :city, :address1, :address2, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchaser_params[:token],
      currency:'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
