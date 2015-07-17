class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :description
      t.date :ends_on
      t.integer :reserve_price
      t.integer :user_id
      t.integer :current_price
      t.string :aasm_state

      t.timestamps null: false
    end
  end
end
