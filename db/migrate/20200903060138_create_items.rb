class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image,               null: false
      t.string :name,                null: false
      t.text :introduce,             null:false
      t.integer :category_id,        null: false
      t.integer :condition_id,       null: false
      t.integer :postage_payer_id,   null: false
      t.integer :prefecture_code_id, null: false
      t.integer :preparation_day_id, null: false
      t.integer :price,              null: false
      t.references :user,            null:false, foreign_key: true
      t.timestamps
    end
  end
end
