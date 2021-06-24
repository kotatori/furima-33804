class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order
  has_one_attached :image

  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :shipping_date
  belongs_to :status

  with_options presence: true do
    validates :image
    validates :product_name
    validates :text
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
      # 備忘録：半角の数字のみ保存可能、価格は300円から9,999,999円の間であること。
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :shipping_date_id
  end
end
