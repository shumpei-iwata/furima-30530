class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  validates :nickname, presence: true
  validates :email, presence: true
  validates :birthday, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'please use double-byte characters' } do
    validates :last_name, presence: true
    validates :fist_name, presence: true
  end
  with_options presence: true, format: { with: /\A([ァ-ン]|ー)+\z/, message: 'please use full-width katakana characters' } do
    validates :last_name_kana, presence: true
    validates :fist_name_kana, presence: true
  end

  has_many :purchase_records
  has_many :items
end
