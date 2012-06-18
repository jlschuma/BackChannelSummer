require 'spec_helper'

describe "CommentsController" do

  describe "for signed in user" do
    # user sign in
    fixtures  :users
    visit ('/')    
    click_button "Log In"
    fill_in "Email",     with: users(:user1).email
    fill_in "Password",  with: users(:user1).password
    click_button "Sign in"
    
    describe "when posting empty comment" do

    end

    describe "when posting non-empty comment" do

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

    describe "delete a comment" do

    end
  
  end

end
