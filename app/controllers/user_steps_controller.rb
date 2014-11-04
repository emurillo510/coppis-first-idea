class UserStepsController < ApplicationController
	include Wicked::Wizard
  steps :info
  
  def show
  	@profile = current_user.profile
    render_wizard
  end
end