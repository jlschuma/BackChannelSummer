require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "Signin page" do
    before { visit signin_path }

    it { should have_selector('title', text: 'Sign In') }
  end

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_selector('title', text: 'Sign in') }
    end

    # this will fail as FactoryGirl gem is not set up yet
    # to create test data; waiting for TA approval;
    # otherwise will have to write fixtures
    #describe "with valid information" do
      #let(:user) { FactoryGirl.create(:user) }
      #before do
        #fill_in "Email",    with: user.email
        #fill_in "Password", with: user.password
        #click_button "Sign in"
      #end

    describe "with valid information" do
      fixtures :users
      before do
        fill_in "Email",     with: users(:user1).email
        fill_in "Password",  with: users(:user1).password
        click_button "Sign in"
      end

      it { should have_selector('title', text: 'Posts') }
      #it { should have_link('Log out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }

      describe "followed by signout" do
        before { click_link "Log Out" }
        it { should have_link('Log In', href: signin_path) } 
      end
    end

  end
end
