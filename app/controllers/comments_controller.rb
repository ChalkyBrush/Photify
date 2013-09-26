class CommentsController < ApplicationController

before_filter :load_picture
#before_filter :ensure_logged_in, :only => [:edit, :create, :show, :update, :destroy]

	def show
		@comment = Comment.find(params[:id])
	end

	def create
		@comment = @picture.comments.build(params[:comment])
		@comment.user_id = current_user.id

		respond_to do |format|
		if @comment.save
      	format.html{redirect_to pictures_path(@picture.id), notice: 'Comment added'} #render html
      	format.js {} #looks for /views/comments/create.js.erb
    	else
      # otherwise render the view associated with the action :new (i.e. new.html.erb)
      	format.html{render "pictures/show", notice: "There was an error" }
      	format.js {}
    	end
    	end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
	end

	private

	def load_picture
		@picture = Picture.find(params[:picture_id])
	end

end


