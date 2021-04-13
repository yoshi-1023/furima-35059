FactoryBot.define do
  factory :order_shipping do
    token {"tok_abcdefghijk00000000000000000"}
    post_code {"123-4567"}
    prefectures_id {2}
    city {"名古屋市中区"}
    address {"丸の内1-1-1"}
    building_name {"ビル"}
    phone_number {"09012345678"}
    association :user
    association :item
  end
end