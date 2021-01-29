class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_fee
  belongs_to :delivery_source
  belongs_to :delivery_date
  belongs_to :user
  has_one :buy
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :explanation
    validates :item_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image

    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :item_status_id
      validates :delivery_fee_id
      validates :delivery_source_id
      validates :delivery_date_id
    end
  end
end
