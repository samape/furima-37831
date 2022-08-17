class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order("created_at DESC")
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

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :content, :category_id, :status_id, :del_charge_id, :prefecture_id, :del_day_id, :price, :user
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
