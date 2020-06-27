class RelationshipsController < ApplicationController
  def index
    @followings = current_user.followings
    @followers = current_user.followers
  end

  def create
    relationship = current_user.active_relationships.build(followed_id: params[:id])

    if relationship.save
      redirect_to root_path, notice: '已開始追蹤'
    else
      redirect_to root_path, notice: '追蹤失敗'
    end

  end

  def destroy
    relationship = Relationship.find_by(followed_id: params[:id])
    if relationship.destroy
      redirect_to root_path, notice: '已取消追蹤'
    else
      redirect_to root_path
    end
  end

end