class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy]


  def create
    @auction = Auction.find params[:auction_id]
    @bid = current_user.bids.new(bid_params)
    @bid.auction = @auction

    respond_to do |format|
      if @auction.bids.any?
        @current_price = @auction.bids.highest_bid_so_far + 1
        if @bid.price <= @current_price
          format.html { redirect_to auction_path(@auction), alert:
                    "Please make a bid greater than the current price"}
        else
          @bid.save
          format.html { redirect_to auction_path(@auction), notice:
                                                      "Bid Created" }
          format.js { render }
        end
      else
        @current_price = @bid.price + 1
        @bid.save
        format.html { redirect_to auction_path(@auction) }
        format.js { render }
      end
    end
  end


  def index
    @bids = Bid.all
  end

  # GET /bids/1
  # GET /bids/1.json
  def show
  end

  # GET /bids/new
  def new
    @bid = Bid.new
  end

  # GET /bids/1/edit
  def edit
  end

  # POST /bids
  # POST /bids.json


  # PATCH/PUT /bids/1
  # PATCH/PUT /bids/1.json
  def update
    respond_to do |format|
      if @bid.update(bid_params)
        format.html { redirect_to @bid, notice: 'Bid was successfully updated.' }
        format.json { render :show, status: :ok, location: @bid }
      else
        format.html { render :edit }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bids/1
  # DELETE /bids/1.json
  def destroy
    @bid.destroy
    respond_to do |format|
      format.html { redirect_to bids_url, notice: 'Bid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_bid
      @bid = Bid.find(params[:id])
    end

    def bid_params
      params.require(:bid).permit(:price)
    end

end
