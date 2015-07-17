class Auction < ActiveRecord::Base

  has_many :bids, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :ends_on, presence: true
  validates :reserve_price, numericality: true

    #
    # aasm do
    #   state :published, initial: true
    #   state :reserve_met
    #   state :won
    #   state :canceled
    #   state :reserve_not_met
    #
    #   event :close do
    #     transitions from: :published, to: :reserve_met
    #   end
    #
    #   event :auction_complete do
    #     transitions from: :reserve_met, to: :won
    #   end
    #
    #   event :cancel do
    #     transitions from: :published, to: :canceled
    #   end
    #
    #   event :auction_price_not_met do
    #     transitions from: :published, to: :reserve_not_met
    #   end
    # end

end
