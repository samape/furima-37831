class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :del_charge
  belongs_to :prefecture
  belongs_to :del_day

  validates :name, :content, :price, :user, presence: true
  validates :category_id, :status_id, :del_charge_id, :prefecture_id, :del_day_id, numericality: { other_than: 1, message: "can't be blank" }
end
