class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @profile = Profile.find(current_user)
    @photos = @profile.photos
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    #@profile = Profile.find(params[:id])
    @photo = Photo.find(params[:id])

  end

  # GET /photos/new
  def new
    @photo = current_user.profile.photos.build

  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @profile = Profile.find(current_user)
    @photo = @profile.photos.build(photo_params)
    if @photo.save
      redirect_to @profile, notice: 'Photo was successfully posted.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /photos/1
  def update
    #respond_to do |format|
      if @photo.update(photo_params)
        redirect_to @photo, notice: 'Photo was successfully updated.'
      else
        render action: 'edit'
      end
    
    #end
  end

  # DELETE /photos/1
  def destroy
    @photo.destroy
    redirect_to photos_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:description, :image)
    end
end
