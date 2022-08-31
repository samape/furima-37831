class PurchasesController < ApplicationController
  before_action :move_to_signin
  before_action :identify_user, only: [:edit, :destroy]
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
    redirect_to root_path if current_user == @item.user || @item.purchase.presence
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(
      :post_code, :prefecture_id, :city, :address, :building, :phone_num
    ).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_signin
    redirect_to new_user_session_path unless user_signed_in?
  end

  def identify_user
    redirect_to root_path unless current_user.id == @item.user_id
  end
end
