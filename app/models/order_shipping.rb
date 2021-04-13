class OrderShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :purchase_record_id, :post_code, :prefectures_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :prefectures_id, numericality: { other_than: 1, message: "Select" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'Input only number' }
  end
  


  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(post_code: post_code, prefectures_id: prefectures_id,city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id )
  end
end