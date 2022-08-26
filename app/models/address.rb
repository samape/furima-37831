class Address < ApplicationRecord
  has_one :purchase
  belongs_to :prefecure
end
