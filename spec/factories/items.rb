FactoryBot.define do
  factory :item do
    item_name {'tomato'}
    item_text {'tomato100'}
    category_id {2}
    product_status_id {2}
    shipping_charges_id {2}
    prefectures_id {2}
    shipping_date_id {2}
    price {40000}
    association :user  
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test1.jpeg'), filename: 'test1.jpeg')
    end
  end
end
