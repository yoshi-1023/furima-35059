class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :shipping_charges
  belongs_to :prefectures
  belongs_to :shipping_date

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_text
    with_options numericality: { other_than: 1 ,message: "Select"} do
      validates :category_id
      validates :product_status_id
      validates :shipping_charges_id
      validates :prefectures_id
      validates :shipping_date_id
    end
    validates :price
  end
  validates :price, numericality: { only_integer: true, message: "Half-width number" }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }
end
