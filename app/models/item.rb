class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :product_status, :shipping_charges, :prefectures, :shipping_date
 

  with_options presence: true do
    validates :item_name
    validates :item_text
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :product_status_id
      validates :shipping_charges_id
      validates :prefectures_id
      validates :shipping_date_id
    end
    validates :price, format: { with: /\A[0-9]+\z/, message: "Half-width number" }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }
  end

end
