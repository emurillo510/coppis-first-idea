class PagesController < ApplicationController
  def home
  	if user_signed_in? && !current_user.profile.nil?
      @micropost = Micropost.new
      @feed_items = current_user.profile.feed.paginate(page: params[:page])
      @profile = current_user.profile
    end
  end

  def messages
  end

  def profile
  end

  def create

    
  end

  private

    def micropost_params
      params.require(:micropost).permit(:id,:content)
    end
end
