json.array!(@bids) do |bid|
  json.extract! bid, :id, :price, :higher_or_lower, :winning_bid, :auction_id, :user_id
  json.url bid_url(bid, format: :json)
end
