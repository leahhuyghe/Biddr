class AuctionsController < ApplicationController
  before_action :set_auction, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @auctions = Auction.all
  end

  def new
    @auction = Auction.new
  end

  def show
    @auction = Auction.find params[:id]
    @bid = Bid.new
    if @auction.bids.any?
      @bids = @auction.bids.order_by_highest
      @current_price = @auction.bids.highest_bid_so_far + 1
    end
  end

  def edit
  end

  def create
    @auction = Auction.new(auction_params)
    if @auction.save
      redirect_to auction_path(@auction), notice: "Auction Created"
    else
      render :new
      flash[:alert] = "Sorry...something went wrong"
    end
  end

  def update
        @auction = Auction.find params[:id]
      if @auction.update(auction_params)
        redirect_to auction_path(@auction), notice: "Auction Updated"
      else
        render :edit
        flash[:alert] = "Sorry...something went wrong"
      end
    end

    def destroy
      @auction = Auction.find params[:id]
      @auction.destroy
      redirect_to auctions_path, alert: "Auction deleted"
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auction
      @auction = Auction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auction_params
      params.require(:auction).permit(:title, :description, :ends_on, :reserve_price, :user_id, :current_price)
    end
end
