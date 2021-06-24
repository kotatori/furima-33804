FactoryBot.define do
  factory :order_form do
    token             {'tok_abcdefghijk00000000000000000'}
    postal_code       {'123-4567'}
    prefecture_id     { 3 }
    municipality      {'草加市'}
    address           {'1-1-1'}
    building_name     {'建物ビル'}
    phone_number      {"09012345678"}
  end
end
