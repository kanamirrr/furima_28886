class Order

  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_code_id, :city, :address1, :address2, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :token
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :prefecture_code_id, numericality: { other_than: 1, message: 'Select' }
    FULL_WIDTH_CHARACTER_REGEX = /\A[ぁ-んァ-ン一-龥]/
    validates :city, format: {with: FULL_WIDTH_CHARACTER_REGEX }
    validates :address1, format: {with: FULL_WIDTH_CHARACTER_REGEX }
    validates :phone_number, format: {with: /\A\d{11}\z/}
  end

  def save
    @purchaserinfo = PurchaserInfo.create(user_id: user_id, item_id: item_id)
    Purchaser.create(post_code: post_code, prefecture_code_id: prefecture_code_id, city: city, address1: address1, address2: address2, phone_number: phone_number, purchaser_info_id: @purchaserinfo.id)
  end
end