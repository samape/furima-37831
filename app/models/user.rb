class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    # 半角英数字混合
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
    # 全角（漢字・ひらがな・カタカナ）
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    # 全角（漢字・ひらがな・カタカナ）
    validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    # 全角（カタカナ）
    validates :first_name_kana, format: { with: /\A[ァ-ヶ]+\z/ }
    # 全角（カタカナ）
    validates :family_name_kana, format: { with: /\A[ァ-ヶ]+\z/ }
    # 生年月日
    validates :birthday
  end

  has_many :item
end
