class CloseAuctionController < ApplicationController

def create
  auction = Auction.find params[:auction_id]
  auction.delete
  if auction.save
    redirect_to auction, notice: "Auction Closed"
  else
    redirect_to auction, alert: "sorry..something went wrong"
  end

end



end
