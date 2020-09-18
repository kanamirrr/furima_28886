class CreatePurchasers < ActiveRecord::Migration[6.0]
  def change
    create_table :purchasers do |t|
      t.string :post_code,           null: false
      t.integer :prefecture_code_id, null: false
      t.string :city,                null: false
      t.string :address1,            null: false
      t.string :address2
      t.string :phone_number,        unll: false
      t.references :purchaser_info,  null:false, foreign_key: true
      t.timestamps
    end
  end
end
