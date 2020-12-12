FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    introduction { Faker::Lorem.sentence }
    price { 333 }
    category_id { 2 }
    condition_id { 2 }
    postage_payer_id { 2 }
    prefecture_id { 2 }
    shipping_day_id { 2 }
    user_id { 1 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
