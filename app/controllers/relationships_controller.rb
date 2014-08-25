class RelationshipsController < ApplicationController

  def create
    @profile = Profile.find(params[:relationship][:followed_id])
    @current = current_user.profile
    @current.follow!(@profile)
    respond_to do |format|
      format.html { redirect_to @profile }
      format.js
    end
  end

  def destroy
    @current = current_user.profile
    @profile = Relationship.find(params[:id]).followed
    @current.unfollow!(@profile)
    respond_to do |format|
      format.html { redirect_to @profile }
      format.js
    end
  end
end