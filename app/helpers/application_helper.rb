module ApplicationHelper
	def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

   def current_user?(user)
      user == current_user
   end

   def current_profile=(profile)
      @current_profile = profile
   end

   def current_profile
      remember_token = Profile.digest(cookies[:remember_token])
      @current_profile ||= Profile.find_by(remember_token: remember_token)
   end

   def current_profile?(profile)
    profile == current_profile
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end
end

