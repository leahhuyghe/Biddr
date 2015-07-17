class Auction < ActiveRecord::Base

  has_many :bids, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :ends_on, presence: true
  validates :reserve_price, numericality: true


end
