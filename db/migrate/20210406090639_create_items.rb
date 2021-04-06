class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,           null: false
      t.text       :item_text ,          null: false
      t.integer    :category_id,         null: false
      t.integer    :product_status_id,   null: false
      t.integer    :shipping_charges_id, null: false
      t.integer    :prefectures_id,      null: false
      t.integer    :shipping_date_id,    null: false
      t.integer    :price,               null: false
      t.references :user,                foreign_key: true
      t.timestamps
    end
  end
end
