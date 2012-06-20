require 'spec_helper'

describe UsersController do
  render_views

  context "for user not logged in" do
    describe "users#index" do
      before do
        visit ('/users')
      end
      it { should raise_error }
    end

    describe "users#edit" do
      fixtures :users
      before do
        visit edit_user_path(users(:user1))
      end
      it { should raise_error }
    end
  end

  context "for non-admin user" do
    describe "users#index" do
      fixtures :users
      before do
        sign_in users(:user1)
        visit ('/users')
      end
      it { should raise_error }
    end

    describe "users#edit" do 
      fixtures :users
      before do
        sign_in users(:user1)
        visit edit_user_path(users(:user1))
      end
      it { should raise_error } 
    end   
  end

  context "for admin user" do
    describe "users#index" do
      fixtures :users
      before do
        sign_in users(:admin)
        visit ('/users')
      end
#      it { should have_selector('title', text: 'Users') }
#      it { should have_button('Edit') }
#      it { should have_button('Delete') }
#      it { should have_button('Create New User') }
    end
  end
end
