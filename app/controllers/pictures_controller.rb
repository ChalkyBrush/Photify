class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
      if current_user
      @comment = @picture.comments.build
      end
  end

  def new
    @picture = Picture.new
  end

  def create
    # make a new picture with what picture_params returns (which is a method we're calling)
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id

    if @picture.save
      redirect_to pictures_path(@picture.id), notice: 'Comment added'
      # format.js {} #looks for /views/comments/create.js.erb
    else
      # otherwise render the view associated with the action :new (i.e. new.html.erb)
      render 'new', notice: "There was an error"
      # format.js {}
    end
  end

  def picture_params
    params.require(:picture).permit(:artist, :title, :url, :category, :user_id)
  end
  
  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    if @picture.update_attributes(picture_params)
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_url
  end

  def filter
    @pictures = Picture.where(category: params[:category])
  end

  def user_pictures
    @pictures = Picture.where(user_id: params[:id])
  end

end