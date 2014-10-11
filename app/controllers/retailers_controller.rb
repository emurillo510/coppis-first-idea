class RetailersController < ApplicationController
   def index
      @profiles = Profile.where(:is_brand => false).paginate(:page => params[:page], :per_page =>8)
   end

    def featured
       @profiles = Profile.where({:is_brand => false , :featured => true}).paginate(:page => params[:page], :per_page =>8)
    end

    def trending
       @profiles = Profile.where({:is_brand => false , :trending => true}).paginate(:page => params[:page], :per_page =>8)
    end
end
