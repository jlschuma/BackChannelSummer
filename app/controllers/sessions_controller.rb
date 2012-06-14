
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if current_user
      flash.now[:error] = 'Sign out, before trying to sign in as a different user'
      redirect_to posts_path
    elsif user && (user.password == (params[:session][:password]))
      sign_in user
      redirect_to posts_path
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path, notice: 'You have been logged out.'
  end

end
