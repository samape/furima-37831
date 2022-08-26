class Purchase < ApplicationRecord
  belongs_to :user
  has_one :item
  has_one :address
end
