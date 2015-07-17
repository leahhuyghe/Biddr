class CloseAuctionController < ApplicationController

def index
  auction = Auction.find params[:auction_id]
  auction.close
  if auction.save
    redirect_to auction, notice: "Auction Closed"
  else
    redirect_to auction, alert: "sorry..something went wrong"
  end

end


end
