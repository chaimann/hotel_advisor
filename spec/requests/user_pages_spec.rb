require 'spec_helper'
require 'rails_helper'

describe "User pages" do

  subject { page }

  describe "signup" do

    before { visit new_user_registration_path }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button "Sign up" }.not_to change(User, :count)
      end
      it { should have_link "Sign in" }
    end

    describe "with valid information" do
      before do
        fill_in "Email",                 with: "Example@User.com"
        fill_in "Password",              with: "foobar123"
        fill_in "Password confirmation", with: "foobar123"
      end

      it "should create a user" do
        expect { click_button "Sign up" }.to change(User, :count).by(1)
      end

      describe "after saving user" do
        before { click_button "Sign up" }
        it { should have_link "Sign out" }
        it { should have_content "Top 5 Hotels" }

        describe "followed by signout" do
          before { click_link "Sign out" }
          it { should have_link('Sign in') }
        end
      end
    end
  end
end