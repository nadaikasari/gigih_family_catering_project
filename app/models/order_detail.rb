class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :menu

  validates :order_id, presence: true
  validates :menu_id, presence: true
  validates :price, presence: true
  validates :quantity, presence: true

end
