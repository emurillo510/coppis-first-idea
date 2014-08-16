class RelationshipsController < ApplicationController

  def create
    @profile = Profile.find(params[:relationship][:followed_id])
    @profile.follow!(@profile)
    respond_to do |format|
      format.html { redirect_to @profile }
      format.js
    end
  end

  def destroy
    @profile = Relationship.find(params[:id]).followed
    @profile.unfollow!(@profile)
    respond_to do |format|
      format.html { redirect_to @profile }
      format.js
    end
  end
end