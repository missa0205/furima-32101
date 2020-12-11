class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  validates :nickname, presence: true, length: { maximum: 40 }
  # validates :email, presence: true, uniqueness: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i.freeze
  validates :password, presence: true,
                       length: { minimum: 6 },
                       format: {
                         with: PASSWORD_REGEX
                       }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥々]/ } do
    validates :family_name, presence: true
    validates :first_name, presence: true
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー-]+\z/ } do
    validates :family_name_kana
    validates :first_name_kana
  end

  validates :birth, presence: true
end
