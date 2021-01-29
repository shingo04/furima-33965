FactoryBot.define do
  factory :item do
    item_name          { Faker::Lorem.characters(number: 10) }
    explanation        { Faker::Lorem.characters(number: 100) }
    category_id        { 1 }
    item_status_id     { 1 }
    delivery_fee_id    { 1 }
    delivery_source_id { 1 }
    delivery_date_id   { 1 }
    item_price         { 400 }
    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
