class Item < ApplicationRecord
  has_one_attched :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :shipping_charges
  belongs_to :prefectures
  belongs_to :shipping_date

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
    validates :price,                  format: {with: /\A[0-9]{300,9999999}+\z/}
  end

end
