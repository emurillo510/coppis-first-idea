class BrandsController < ApplicationController
	def index
           @profiles = Profile.where(:is_brand => true).paginate(:page => params[:page], :per_page =>8)
	end

        def featured
           @profiles = Profile.where({:is_brand => true , :featured => true}).paginate(:page => params[:page], :per_page =>8)
        end

        def trending
           @profiles = Profile.where({:is_brand => true , :trending => true}).paginate(:page => params[:page], :per_page =>8)
        end

end
