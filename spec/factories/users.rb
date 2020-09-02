FactoryBot.define do
  factory :user do
    family_name           {"山田"}
    first_name            {"陽子"}
    family_name_kana      {"ヤマダ"}
    first_name_kana       {"ヨウコ"}
    nickname              {Faker::Name.initials(number: 4)}
    birth_day             {Faker::Date.birthday}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
