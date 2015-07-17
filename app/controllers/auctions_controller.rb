class AuctionsController < ApplicationController
  before_action :set_auction, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!, except: [:index, :show]

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

  # POST /auctions
  # POST /auctions.json
  def create
      @auction = current_user.auctions.new(auction_params)
    if @auction.save
      redirect_to auction_path(@auction), flash[:alert] = "Auction created"
    else
      render :new
      flash[:alert] = "Sorry...something went wrong"
    end
  end

  def update
    respond_to do |format|
      if @auction.update(auction_params)
        format.html { redirect_to @auction, notice: 'Auction was successfully updated.' }
        format.json { render :show, status: :ok, location: @auction }
      else
        format.html { render :edit }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @auction.destroy
    respond_to do |format|
      format.html { redirect_to auctions_url, notice: 'Auction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auction
      @auction = Auction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auction_params
      params.require(:auction).permit(:title, :description, :ends_on, :reserve_price, :user_id, :current_price, :aasm_state, :auction_id)
    end
end
