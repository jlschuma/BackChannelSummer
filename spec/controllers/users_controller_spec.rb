require 'spec_helper'

describe "UserControler" do

  describe "for non-admin user:" do
    fixtures :users

    # already registered; just sign in
    before do
      visit ('/') 
      # add this here so gem launchy can show the page on a browser window
      save_and_open_page
   
      click_button "Log In"
      fill_in "Email",     with: users(:user1).email
      fill_in "Password",  with: users(:user1).password
      click_button "Sign in"
  
      # GET
      describe "get index" do
        before { visit user_path }
        specify { response.should redirect_to(posts_path) } 
      end   

      # EDIT
      describe "visit the edit page" do   
        before { visit edit_user_path(users(:user1)) }
        specify { response.should redirect_to(posts_path) } 
      end   

      # UPDATE
      describe "submit to the update action" do   
        before { put edit_user_path(users(:user1)) }
        specify { response.should redirect_to(posts_path) } 
      end   
 
      click_button "Log out"
    end


  describe "for admin user:" do
    fixtures :users

    # admin signing in
    before do
      visit ('/')
      # add this here so gem launchy can show the page on a browser window
      save_and_open_page
      click_button "Log In"
      fill_in "Email",     with: users(:admin).email
      fill_in "Password",  with: users(:admin).password
      click_button "Sign in"
 

    # GET
    describe "get index" do
      before { visit user_path }
      page.should have_selector('title', text: 'Posts') 
    end   

    # EDIT
    describe "visit the edit page" do   
      before { visit edit_user_path(users(:user1)) }
      page.should have_content("Administrator")
    end   

    # UPDATE
    describe "submit to the update action" do   
      before { put edit_user_path(users(:user1)) }
      page.should have_content("Administrator") 
    end   

    # DESTROY
    describe "delete a user" do   
 
    end   

    end
 
  end

end
