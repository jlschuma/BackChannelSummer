require 'spec_helper'

describer "ReportsController" do

  describe "for someone who hasn't logged in" do
    describe "GET index" do
      before { visit ('/reports') }
      specify { response.should redirect_to(signin_path) } 
    end
  end

  describe "for non admin user:" do
    fixtures :users
    before do
      # sign in as non-admin user
      visit root_path  
      click_button "Log In"
      fill_in "Email",     with: users(:user1).email
      fill_in "Password",  with: users(:user1).password
      click_button "Sign in"
    end

    describe "GET index" do
      before { visit ('/reports') }
      specify { response.should redirect_to(post_path) } 
    end

    click_button "Log out"

  end

  describe "for admin user:" do
    fixtures :users
    before do
      # sign in as non-admin user
      visit ('/') 
      # add this here so gem launchy can show the page on a browser window
      save_and_open_page
   
      click_button "Log In"
      fill_in "Email",     with: users(:admin).email
      fill_in "Password",  with: users(:admin).password
      click_button "Sign in"
    end

    describe "GET index" do
      before { visit ('/reports') }
      page.should have_content("Administrator")
    end

    click_button "Log out"

  end
 
end
