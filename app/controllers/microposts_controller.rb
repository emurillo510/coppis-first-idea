class MicropostsController < ApplicationController
  before_action :user_signed_in?

  def create
    @profile = Profile.find(current_user)
    #@microposts = @profile.microposts.paginate(page: params[:page])
    @micropost = @profile.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      redirect_to :back
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
end