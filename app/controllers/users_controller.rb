class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:follow, :unfollow]

  def follow
    if current_user.active_relationships.create(followed_user: @user)
      redirect_to root_path, notice: '已開始追蹤'
    else
      redirect_to root_path, notice: '追蹤失敗'
    end
  end

  def unfollow
    relationship = current_user.active_relationships.find_by(followed_user: @user)
    relationship.destroy 
    redirect_to root_path, notice: '已取消追蹤'
  end

  private
  def find_user
    @user = User.find(params[:id])
  end
end