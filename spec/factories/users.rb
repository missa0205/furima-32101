FactoryBot.define do
  factory :user do
    nickname              { "test" }
    email                 { "test@gmail.com" }
    password              { "test000" }
    password_confirmation { password }
    family_name           { "ぜんかく" }
    first_name            { "ぜんかく" }
    family_name_kana      { "ゼンカクカナ" }
    first_name_kana       { "ゼンカクカナ" }
    birth                 { "1930-01-01" }
  end
end