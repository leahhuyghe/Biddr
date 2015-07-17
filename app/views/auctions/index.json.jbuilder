json.array!(@auctions) do |auction|
  json.extract! auction, :id, :title, :description, :ends_on, :reserve_price, :user_id, :current_price, :aasm_state
  json.url auction_url(auction, format: :json)
end
