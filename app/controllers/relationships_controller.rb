class RelationshipsController < ApplicationController
  def index
  end

  def create
    followed_user = User.find_by(id: params[:user_id])
    relationship = current_user.active_relationship.build(followed_id: followed_user.id)

    if relationship.save
      redirect_to root_path, notice: '好友增加成功'
    else
      redirect_to root_path, notice: '好友增加失敗'
    end
    
  end

end