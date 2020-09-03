class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    FULL_WIDTH_CHARACTER_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    validates :family_name, format: { with: FULL_WIDTH_CHARACTER_REGEX, message: 'full-width characters.' }
    validates :first_name, format: { with: FULL_WIDTH_CHARACTER_REGEX, message: 'full-width characters.' }
    FULL_WIDTH_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    validates :family_name_kana, format: { with: FULL_WIDTH_KANA_REGEX, message: 'full-width katakana characters.' }
    validates :first_name_kana, format: { with: FULL_WIDTH_KANA_REGEX, message: 'full-width katakana characters.' }
    validates :nickname
    validates :birth_day
    validates :password_confirmation
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'include both letters and numbers.'
  end

end

