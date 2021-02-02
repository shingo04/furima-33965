FactoryBot.define do
  factory :order_address do
    postal_code        { '123-4567' }
    delivery_source_id { 1 }
    cities             { '横浜市緑区' }
    address            { '青山1-1-1' }
    building_name      { '柳ビル103' }
    phone_number       { '09011223344' }
    token              { 'tok_abcdefghijk00000000000000000' }
    user_id            { 1 }
    item_id            { 1 }
  end
end
