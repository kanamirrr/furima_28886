class ItemsController < ApplicationController
  before_action :move_to_signin, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :images)
  end

  def move_to_signin
    unless user_signed_in?
      redirect_to user_session_path
    end
  end
end
