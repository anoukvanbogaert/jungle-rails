class Order < ApplicationRecord
  
  # this makes it possible to do order,line_items in controller which gets all the line items for a specific order number
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

end
