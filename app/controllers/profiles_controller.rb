class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /profiles
  def index
    @profiles = Profile.all.order(:name).paginate(:page => params[:page], :per_page => 8)
  end

  # GET /profiles/1
  def show
  end

  # GET /profiles/new
  def new
    @profile = current_user.profile.build
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  def create
    @profile = current_user.profile.build(profile_params)
    if @profile.save
      redirect_to @profile, notice: 'Profile was successfully created.'
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def correct_user
      @profile = current_user.profile.find_by(id: params[:id])
      redirect_to profiles_path, notice: "Not authorized to edit this company profile" if @profile.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:avatar, :description, :name, :is_brand, :website, :location, :what_we_make, :brands_we_carry)
    end
end
