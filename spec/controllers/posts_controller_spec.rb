require 'spec_helper'

describe PostsController do
  render_views

  describe "GET index" do
    before do
      visit posts_path
      save_and_open_page
    end
#    it { should have_selector('title', text: 'Posts') }
 end

  describe "POST" do
    context "as registered user" do
      fixtures :users

      before do
        sign_in users(:user1)
        visit new_post_path
      end
#      it { should have_selector('title', title: 'Say something!') }
#      it { should have_button('Ok') }
    end 
  end

end
