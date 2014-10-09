class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /profiles
  def index
    if params[:tag]
      @profiles = Profile.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 8)
	 else
      @profiles = Profile.all.order(:name).paginate(:page => params[:page], :per_page => 8)
    end
  end

  # GET /profiles/1
  def show
    @profile = Profile.find(params[:id])
    @microposts = @profile.microposts.paginate(page: params[:page])
    @photos = @profile.photos

    @stockist_profiles = []
    @stockist_profiles_nil = []
    @profile.stockist_list.each do |s|
      profile = Profile.find_by name: s
        if !profile.nil?
           @stockist_profiles.push(profile)
        elsif
           @stockist_profiles_nil.push(s)
        end
    end
  end

  # GET /profiles/new
  def new
    @user = current_user
    @profile = @user.build_profile
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to user_steps_path
    else
      render action: 'new'
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile.destroy
    redirect_to profiles_url
  end

  def following
    @title = "Following"
    @profile = Profile.find(params[:id])
    @profiles = @profile.followed_profiles.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @profile = Profile.find(params[:id])
    @profiles = @profile.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Micropost.where("profile_id = ?", id)
  end
  
    def get_overview
    #@profile = current_user.profile
    #@microposts = @profile.microposts.paginate(page: params[:page])
    #@photos = @profile.photos
    @profile = Profile.find( params[:id] )
   @microposts = @profile.microposts.paginate( page: params[:page])
   @photos = @profile.photos
   



      respond_to do |format|
  
         format.html { redirect_to profile_path(@profile)}
      end
    end
    
    def get_news
      
      @profile = Profile.find( params[:id] ) 
      @microposts = @profile.microposts.paginate( page: params[:page] )
      @photos = @profile.photos
    
    end
    
    def get_followers
       @profile = Profile.find( params[:id] )
       @microposts = @profile.microposts.paginate( page: params[:page] )
       @photos = @profile.photos
       
       @title = "Followers"
       @profiles = @profile.followers.paginate( page: params[:page] )
      
    end

    def get_following
       @profile = Profile.find( params[:id] )
       @microposts = @profile.microposts.paginate( page: params[:page] )
       @photos = @profile.photos
       
       @title = "Following"
       @profiles = @profile.followed_profiles.paginate( page: params[:page] )
      
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to profiles_path, notice: "Not authorized to edit this company profile" if @profile.nil?
    end

    def admin_user
      redirect_to(root_url) unless @profile.admin?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:avatar, :description, :name, :is_brand, :website, :location, :what_we_make, :brands_we_carry, :looking_for, :stockist_list, :tag_list, :tagline, :cover)
    end
    
    
  
end
