class RelationshipsController < ApplicationController
  def index
  end

  def create
    relationship = current_user.active_relationships.build(followed_id: params[:id])

    if relationship.save
      redirect_to root_path, notice: '好友增加成功'
    else
      redirect_to root_path, notice: '好友增加失敗'
    end

  end

end