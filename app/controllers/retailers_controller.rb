class RetailersController < ApplicationController
	def index
		@profiles = Profile.where(:is_brand => false).paginate(:page => params[:page], :per_page =>8)
	end
end