class BrandsController < ApplicationController
	def index
		@profiles = Profile.where(:is_brand => true).paginate(:page => params[:page], :per_page =>8)
	end
end