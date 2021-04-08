FactoryBot.define do
  factory :item do
    item_name {'tomato'}
    item_text {'tomato100'}
    category_id {'2'}
    product_status_id {'2'}
    shipping_charges_id {'2'}
    prefectures_id {'2'}
    shipping_date_id {'2'}
    price {'40000'}
    association :user  
    
    trait :image do
      after(:build) do |item|
        File.open("#{Rails.root}/spec/fixtures/test1.jpeg") do |f|
          item.images.attach(io: f, filename: "Unknown.jpeg", content_type: 'image/jpeg')
        end
      end
    end
  end
end
