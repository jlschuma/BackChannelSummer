require 'spec_helper'

describe "PostsController" do

  describe "GET index" do
    before { visit ('/') }
    page.should have_selector('title', text: 'Posts')
  end  

  describe "for registered user" do
    fixtures  :users
    visit ('/') 
    # add this here so gem launchy can show the page on a browser window
    save_and_open_page
   
    click_button "Log In"
    fill_in "Email",     with: users(:admin).email
    fill_in "Password",  with: users(:admin).password
    click_button "Sign in"    describe "when posting empty comment" do

    
    describe "create an empty post" do

    end

      describe "create a non-empty post" do

    end

    click_button "Log out"

  end

  describe "for admin user" do
    fixtures  :users
    visit ('/') 
    # add this here so gem launchy can show the page on a browser window
    save_and_open_page
   
    click_button "Log In"
    fill_in "Email",     with: users(:admin).email
    fill_in "Password",  with: users(:admin).password
    click_button "Sign in"

    describe "delete a post" do

    end
  
  end

end
