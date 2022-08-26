class PurchasesController < ApplicationController
  def index
  end

  def new
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
