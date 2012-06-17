
class ReportsController < ApplicationController
  before_filter :admin_user

  def index
    @posts = Post.all.sort
    @users = User.all.sort_by {|user| -user.posts.length }
  end

  def admin_user
    @user = self.current_user
    if !@user
      redirect_to signin_path, notice: "Please sign in."
    else
      if !@user.isAdmin?
        redirect_to posts_path, notice: "Action not permitted"
      end
    end
  end
end
