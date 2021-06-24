FactoryBot.define do
  factory :order do
    postal_code       {'123-4567'}
    prefecture_id     {3}
    municipality      {'草加市'}
    address           {'1-1-1'}
    building_name     {'建物ビル'}
    phone_number      {'09022223333'}
  end
end
