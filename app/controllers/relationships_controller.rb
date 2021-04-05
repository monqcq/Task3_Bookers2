class RelationshipsController < ApplicationController
  before_action :set_user
  
  def create
    following = current_user.follow(@user)
    following.save
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    following = current_user.unfollow(@user)
    following.destroy
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def set_user
  #  @user = User.find(params[:relationship][:followed_id])
    @user = User.find(params[:followed_id])
  end
  
end
