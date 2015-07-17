require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do
  let(:auction) { create(:auction) }

  describe "#index" do
    it "renders the index homepage" do
      get :index
      expect(response).to render_template(:index)
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

  end

  describe "#create" do

    context "with valid params" do

      it "sets a flash message" do
        expect(flash[:notice])
      end
    end

    describe "#new" do
      it "renders the new auction view" do
        get :new
        expect(response).to render_template(:new)
      end

      it "sets an instance variable to create a new auction" do
        get :new
        expect(assigns(:auction)).to be_a_new Auction
      end

    end



  end



end
