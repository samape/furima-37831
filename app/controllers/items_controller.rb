class ItemsController < ApplicationController
  def index
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
      :name, :content, :category_id, :status_id, :del_charge_id, :prefecture_id, :del_day_id, :price, :user
    )
  end
end
