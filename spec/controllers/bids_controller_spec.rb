require 'rails_helper'

RSpec.describe BidsController, type: :controller do
  describe "#create" do
    it "creating a bid in the db" do
      def valid_request
          post :create, auction_id: auction.id,
                        bid: attributes_for(:bid)
        end
        
      expect { valid_request }.to change { Bid.count }.by(1)
    end

  end
end
