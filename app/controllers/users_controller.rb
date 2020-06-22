class UsersController < ApplicationController

  def sign_up
    @user = User.new
  end

  def registration
    @user = User.new(user_params)

    if @user.save
      session[:heyyu] = @user.id
      redirect root_path
    else
      render :sign_up
    end
  end

  def login
    @user = User.new
  end

  def sign_in
    user = User.find_by(email: user_params[:email])

    if user && user.authenticate(user_params[:password])
      session[:heyyu] = @user.id
      redirect root_path
    else
      render :login
    end
  end

  private
  def user_params
    params.require(:user).permit(:email
                                 :password
                                 :password_confirmation
                                 :account
                                 :nickname)
  end

end