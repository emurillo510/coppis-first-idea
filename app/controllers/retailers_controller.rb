class RetailersController < ApplicationController
   def index
      @profiles = Profile.all.order(:name).where(:is_brand => false).paginate(:page => params[:page], :per_page =>8)
   end

    def featured
       @profiles = Profile.all.order(:name).where({:is_brand => false , :featured => true}).paginate(:page => params[:page], :per_page =>8)
    end

    def trending
       @profiles = Profile.all.order(:name).where({:is_brand => false , :trending => true}).paginate(:page => params[:page], :per_page =>8)
    end
end
