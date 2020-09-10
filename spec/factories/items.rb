FactoryBot.define do
  factory :item do
    name               { 'オリーブの木' }
    introduce          { 'ナチュラルなインテリアに合います。' }
    category_id        { '5' }
    condition_id       { '4' }
    postage_payer_id   { '3' }
    prefecture_code_id { '14' }
    preparation_day_id { '3' }
    price              { '20000' }
    association :user
  end
end
