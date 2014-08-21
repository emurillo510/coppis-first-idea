class PagesController < ApplicationController
  def home
  	if user_signed_in?
      @micropost = Micropost.new
      #@feed_items = current_user.feed.paginate(page: params[:page])
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
