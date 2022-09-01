class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :del_charge
  belongs_to :prefecture
  belongs_to :del_day

  has_one_attached :image

  validates :name, :content, :image, presence: true
  validates :price, presence: true, numericality: {
    only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid'
  }
  validates :category_id, :status_id, :del_charge_id, :prefecture_id, :del_day_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
