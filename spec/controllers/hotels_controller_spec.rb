require 'spec_helper'
require 'rails_helper'

describe HotelsController do
  let(:user) { FactoryGirl.create(:user) }

  describe "when user is not signed in" do
    describe "GET index" do
      it "redirects to sign in page" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET new" do
      it "redirects to sign in page" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "when user is signed in" do
    before { sign_in user }

    describe "GET index" do
      it "renders index page" do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe "GET new" do
      it "renders new hotel's template" do
        get :new
        expect(response).to render_template(:new)
      end
    end
  end
end