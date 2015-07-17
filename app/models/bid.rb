class Bid < ActiveRecord::Base
belongs_to :auction
validates :price, numericality: true

def self.highest_bid_so_far
  order(price: "DESC").first.price
end

def self.order_by_highest
  order(price: "DESC")
end

end
