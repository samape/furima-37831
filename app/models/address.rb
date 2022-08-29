class Address < ApplicationRecord
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
