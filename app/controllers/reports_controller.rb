
class ReportsController < ApplicationController
  def index
    @posts = Post.all.sort
    @users = User.all.sort_by {|user| -user.posts.length }
  end
end
