FactoryBot.define do
  factory :order do
    token              { '13dgvkrfijewio3iew' }
    post_code          { '123-4567' }
    prefecture_code_id { '14' }
    city               { '港区' }
    address1           { '青山１ー１ー１' }
    address2           { '1002' }
    phone_number       { '09012345678' }
  end
end
