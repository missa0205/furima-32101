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
    # association :category
    # association :condition
    # association :postage_payer
    # association :prefecture
    # association :shipping_day

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end

  # factory :category do
  #   name { "メンズ" }
  # end

  # factory :condition do
  #   name { "新品" }
  # end

  # factory :postage_payer do
  #   name { "着払い" }
  # end

  # factory :prefecture do
  #   name { "北海道" }
  # end

  # factory :shipping_day do
  #   name { "1日" }
  # end
end
