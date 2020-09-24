class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture_code
  belongs_to_active_hash :preparation_day
  has_many_attached :images
  belongs_to :user
  has_one :purchaser
  has_one :purchaser_info

  with_options presence: true do
    validates :images, length: {minimum:1, maximum:5, message: 'Upload limit 5' }
    validates :name, length: { maximum: 40 }
    validates :introduce, length: { maximum: 1000 }
    validates :category_id, numericality: { other_than: 1, message: 'Select' }
    validates :condition_id, numericality: { other_than: 1, message: 'Select' }
    validates :postage_payer_id, numericality: { other_than: 1, message: 'Select' }
    validates :prefecture_code_id, numericality: { other_than: 1, message: 'Select' }
    validates :preparation_day_id, numericality: { other_than: 1, message: 'Select' }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range, Half-width number' }
  end
end
