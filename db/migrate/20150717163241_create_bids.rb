class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :price
      t.boolean :higher_or_lower
      t.boolean :winning_bid
      t.integer :auction_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
