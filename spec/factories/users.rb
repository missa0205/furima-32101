FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 6) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { 'ぜんかく' }
    first_name            { 'ぜんかく' }
    family_name_kana      { 'ゼンカクカナ' }
    first_name_kana       { 'ゼンカクカナ' }
    birth                 { '1930-01-01' }
  end
end
