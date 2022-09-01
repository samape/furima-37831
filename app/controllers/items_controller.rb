class ItemsController < ApplicationController
  before_action :move_to_signin, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :identify_user, only: [:edit, :destroy]
  before_action :sold_out, only: [:edit]

  def index
    @items = Item.includes(:purchase).order('created_at DESC')
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :content, :category_id, :status_id, :del_charge_id, :prefecture_id, :del_day_id, :price, :user
    ).merge(user_id: current_user.id)
  end

  def move_to_signin
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def identify_user
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def sold_out
    redirect_to root_path if @item.purchase.presence
  end
end
