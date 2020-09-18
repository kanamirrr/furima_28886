class PurchaserInfo < ApplicationRecord
  has_one :purchaser
  belongs_to :user
  belongs_to :item
end
