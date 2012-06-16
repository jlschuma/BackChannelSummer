require 'spec_helper'

describe "UserPages" do

  subject { page }


  describe "User signup" do

    before { visit signup_path }

    let(:submit) { "Ok" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit}.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Email",            with: "testuser@example.com"
        fill_in "Password",         with: "testUserpw1"
        fill_in "Confirm password", with: "testUserpw1"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end

  end
end
