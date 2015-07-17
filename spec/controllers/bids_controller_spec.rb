require 'rails_helper'

RSpec.describe BidsController, type: :controller do
  let(:bid) { create(:bid, user: user, auction: auction)}
  let(:user)  { create(:user) }
  let(:auction) { create(:auction) }

  describe "#create" do
    context "with valid params" do

      it "sets a flash message" do
          expect(flash[:notice])
        end


    end
  end

end
