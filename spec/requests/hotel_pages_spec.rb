require 'spec_helper'
require 'rails_helper'

describe "Hotel pages" do

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  subject { page }

  describe "adding hotel" do
    before { visit new_hotel_path }
    it { should have_content "Enter hotel info" }

    describe "with invalid information" do
      it "should not create a hotel" do
        expect { click_button "Create Hotel" }.not_to change(Hotel, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Title", with: "Love Hotel"
        page.choose "5"
      end

      it "should create a hotel" do
        expect { click_button "Create Hotel" }.to change(Hotel, :count).by(1)
      end

      it { should_not have_content "Leave your feedback" }
    end
  end

  describe "visiting hotel created by another user" do
    let(:hotel) { FactoryGirl.create(:hotel) }
    before { visit hotel_path(hotel) }
    it { should have_content "Leave your feedback" }

    describe "adding feedback" do
      before do
        page.choose "5"
        fill_in "Comment", with: "Lorem ipsum"
      end

      it "should create new feedback" do
        expect { click_button "Submit!" }.to change(Comment, :count).by(1)
      end
    end
  end
end