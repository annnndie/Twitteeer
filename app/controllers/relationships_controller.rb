class RelationshipsController < ApplicationController
  def index
    @followings = current_user.followings
    @followers = current_user.followers
  end
end