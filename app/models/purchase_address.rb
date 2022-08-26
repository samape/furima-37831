class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building, :phone_num, :purchase_id

  with_options presence: true do
    validates :user_id, :item_id, :purchase_id, :city, :address
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_num, format: {with: /\A[0-9]{10-11}\z/, message: "is invalid. Not include hephen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_num: phone_num, purchase_id: purchase.id)
  end
end