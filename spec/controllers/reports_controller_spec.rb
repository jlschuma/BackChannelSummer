require 'spec_helper'

describe ReportsController do
  render_views

  describe "GET index: when user is not logged in" do
    before do
      visit ('/reports') 
    end
    it { should raise_error }
  end

  describe "GET index" do
    context "as non-admin user" do
      fixtures :users

      before do
        sign_in users(:user1)
        visit ('/reports')
      end
      it { should raise_error }
    end
  end

  describe "GET index" do
    context "as admin user" do
      fixtures :users

      before do
        sign_in users(:admin)
        visit ('/reports')
      end
#      it { should have_selector('title', text: 'Administrator Reports') }
    end
  end

end
