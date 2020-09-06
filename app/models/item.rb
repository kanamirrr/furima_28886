class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture_code
  belongs_to_active_hash :preparation_day
  has_many_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :category_id, numericality: { other_than: 1 } 
    validates :condition_id, numericality: { other_than: 1 } 
    validates :postage_payer_id, numericality: { other_than: 1 } 
    validates :prefecture_code_id, numericality: { other_than: 1 } 
    validates :preparation_day_id, numericality: { other_than: 1 } 
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/, message:"falf-width number." }
  end

end
